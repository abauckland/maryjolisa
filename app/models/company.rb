class Company < ActiveRecord::Base
  has_many :users
  mount_uploader :logo, LogoUploader
 
  after_create :default_settings
    
  geocoded_by :postcode
  after_validation :geocode, :if => :postcode_changed?
  
  def phone_number
    tel.unpack('A4A3A4').join(' ')
  end

  def www
    return subdomain+ '.' +domain
  end

 def default_settings
          Mjweb::Design.create(:company_id => self.id)
          Mjweb::Detail.create(:company_id => self.id)
          Mjweb::Hour.create(:company_id => self.id)
 end

   
end
