class Company < ActiveRecord::Base
  SUBDOMAIN_REGEXP = /\A[a-z\-]+\z/

  has_many :users
  mount_uploader :logo, LogoUploader

  after_initialize :set_default_retail_subdomain
  after_create :default_settings

  geocoded_by :postcode
  after_validation :geocode, :if => :postcode_changed?

  validates :subdomain, :retail_subdomain, presence: true, length: { maximum: 20 },
    format: { with: SUBDOMAIN_REGEXP, message: "can only contain letters and dashes" }

  validate :subdomain_uniqueness, :retail_subdomain_uniqueness
  validate :subdomain_not_changed, :retail_subdomain_not_changed, :if => :persisted?

  def phone_number
    tel.unpack('A4A3A4').join(' ')
  end

  def www
    return subdomain+ '.' +domain
  end

  def subdomain=(text)
    super(text.downcase)
  end

  def retail_subdomain=(text)
    super(text.downcase)
  end

  def has_store?
    STORES_PATH.join(retail_subdomain).exist?
  end

 def default_settings
          Mjweb::Design.create(:company_id => self.id)
          Mjweb::Detail.create(:company_id => self.id)
          Mjweb::Hour.create(:company_id => self.id)
 end

  protected

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
