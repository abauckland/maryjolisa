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
   format: { with: NAME_REGEXP, message: "please enter a valid name" }

  validates :address_1, :address_2,
   format: { with: CITY_REGEXP, message: "please enter a valid city name" }

  validates :city, :county,
   format: { with: CITY_REGEXP, message: "please enter a valid city name" }

  validates :postcode,
    format: { with: POSTCODE_REGEXP, message: "please enter a valid postcode, including a space between the area and street codes e.g.SK2 6PL" }

  validates :tel, :alt_tel,
    format: { with: PHONE_REGEXP, message: "please enter a valid phone number. Phone number should start with a '0'" }

#  validates :email,

  validates :vat_no,
    uniqueness: {message: "a company with this vat number is already in use"},
    format: { with: VAT_REGEXP, message: "please enter a valid vat number. Omit any spaces and where 'GB' prefix is included (optional) this must be capitals" }

  validates :reg_no,
    uniqueness: {message: "a company with this registration number is already in use"},
    format: { with: REG_REGEXP, message: "please enter a valid registration number. Omit any spaces and 'SC' prefixes (for companies registered in Scotland) must be in capitals" }



  validates :subdomain, :retail_subdomain, presence: true, length: { maximum: 20 },
    format: { with: SUBDOMAIN_REGEXP, message: "can only contain letters and dashes" }

  validate :subdomain_uniqueness, :retail_subdomain_uniqueness
  validate :subdomain_not_changed, :retail_subdomain_not_changed, :if => :persisted?  

  def name=(text)
    super(text.downcase)
  end

  def address_1=(text)
    super(text.downcase)
  end

  def address_2=(text)
    super(text.downcase)
  end

  def city=(text)
    super(text.downcase)
  end

  def county=(text)
    super(text.downcase)
  end

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
  end

  def set_default_retail_subdomain
    self.retail_subdomain ||= "#{subdomain}-store"
  end

  def subdomain_uniqueness
    return if subdomain.blank? || !subdomain_changed?
    errors.add(:subdomain, :taken) if given_subdomain_exists?(subdomain)
  end

  def retail_subdomain_uniqueness
    return if retail_subdomain.blank? || !retail_subdomain_changed?
    errors.add(:retail_subdomain, :taken) if given_subdomain_exists?(retail_subdomain)
  end

  def given_subdomain_exists?(domain)
    Company.where("subdomain = :domain OR retail_subdomain = :domain", domain: domain).any?
  end

  def subdomain_not_changed
    errors.add(:subdomain, "cannot be changed") if subdomain_changed?
  end

  def retail_subdomain_not_changed
    errors.add(:retail_subdomain, "cannot be changed") if retail_subdomain_changed?
  end
end
