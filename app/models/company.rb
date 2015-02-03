class Company < ActiveRecord::Base

  has_many :users
  mount_uploader :logo, LogoUploader

  after_initialize :set_default_retail_subdomain
  after_create :default_settings
  
  geocoded_by :postcode
  after_validation :geocode, :if => :postcode_changed?

  validates :name,
   presence: true,
   uniqueness: { case_sensitive: false, message: "a company with the same name already exists" },
   format: { with: COMPANY_NAME_REGEXP, message: "please enter a valid name" }

  validates :address_1, :address_2,
    allow_blank: true,
   format: { with: ADDRESS_REGEXP, message: "please enter a valid address" }

  validates :city, :county,
    allow_blank: true,
   format: { with: CITY_REGEXP, message: "please enter a valid city name" }

  validates :postcode,
    allow_blank: true,
    format: { with: POSTCODE_REGEXP, message: "please enter a valid postcode, including a space between the area and street codes e.g.SK2 6PL" }

  validates :tel, :alt_tel,
    allow_blank: true,
    format: { with: PHONE_REGEXP, message: "please enter a valid phone number. Phone number should start with a '0'" }

#  validates :email,

  validates :vat_no,
    allow_blank: true,
    uniqueness: {message: "a company with this vat number is already in use"},
    format: { with: VAT_REGEXP, message: "please enter a valid vat number. Omit any spaces and where 'GB' prefix is included (optional) this must be capitals" }

  validates :reg_no,
    allow_blank: true,
    uniqueness: {message: "a company with this registration number is already in use"},
    format: { with: REG_REGEXP, message: "please enter a valid registration number. Omit any spaces and 'SC' prefixes (for companies registered in Scotland) must be in capitals" }

  validates :subdomain, presence: true, length: { maximum: 20 },
    format: { with: COMPANY_SUBDOMAIN_REGEXP, message: "can only contain letters, numbers and dashes" }

  validates :retail_subdomain, presence: true, length: { maximum: 20 },
    format: { with: SUBDOMAIN_REGEXP, message: "can only contain letters and dashes" }

  validate :retail_subdomain_uniqueness
  validate :retail_subdomain_not_changed, :if => :persisted?  


  def email=(text)
    super(text.downcase)
  end

  def retail_subdomain=(text)
    super(text.downcase)
  end

  def has_store?
    STORES_PATH.join(retail_subdomain).exist?
  end


  def phone_number
    tel.unpack('A4A3A4').join(' ')
  end

  def alt_phone_number
    alt_tel.unpack('A4A3A4').join(' ')
  end

  def www
    return subdomain+ '.' +domain
  end


  protected

  def default_settings
    Mjweb::Design.create(:company_id => self.id)
    Mjweb::Detail.create(:company_id => self.id)
    Mjweb::Hour.create(:company_id => self.id)
    
    Mjbook::Companyaccount.create(:company_id => self.id, :name => "cash")
    Mjbook::Invoiceterm.create(:company_id => self.id, :ref => "30 days", :period => "30", :terms => "Payment due within 30 days from the date of invoice")
    Mjbook::Quoteterm.create(:company_id => self.id, :ref => "60 days", :period => "60", :terms => "Valid for 60 days after the date of quote")
    
    Mjbook::Hmrcexpcat.create(:company_id => self.id, :category => "mileage", :hmrcgroup_id => 1)
    
    Mjbook::Mileagemode.create(:company_id => self.id, :mode => "car/van (<10,000 miles)", :rate => 0, :hmrc_rate => 0.45)
    Mjbook::Mileagemode.create(:company_id => self.id, :mode => "car/van (>10,000 miles)", :rate => 0, :hmrc_rate => 0.25)
    Mjbook::Mileagemode.create(:company_id => self.id, :mode => "motorcycle", :rate => 0, :hmrc_rate => 0.24)
    Mjbook::Mileagemode.create(:company_id => self.id, :mode => "cycle", :rate => 0, :hmrc_rate => 0.20)

    Mjbook::Setting.create(:company_id => self.id)


  end

  def set_default_retail_subdomain
    self.retail_subdomain ||= "#{subdomain}-store"
  end

#  def subdomain_uniqueness
#    return if subdomain.blank? || !subdomain_changed?
#    errors.add(:subdomain, :taken) if given_subdomain_exists?(subdomain)
#  end

  def retail_subdomain_uniqueness
    return if retail_subdomain.blank? || !retail_subdomain_changed?
    errors.add(:retail_subdomain, :taken) if given_subdomain_exists?(retail_subdomain)
  end

  def given_subdomain_exists?(domain)
    Company.where("retail_subdomain = :domain", domain: domain).any?
  end

  def retail_subdomain_not_changed
    errors.add(:retail_subdomain, "cannot be changed") if retail_subdomain_changed?
  end
end
