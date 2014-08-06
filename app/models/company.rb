class Company < ActiveRecord::Base
  has_many :users
  mount_uploader :logo, LogoUploader
    
  geocoded_by :postcode
  after_validation :geocode, :if => :postcode_changed?
  
  def phone_number
    tel.unpack('A4A3A4').join(' ')
  end
    
end
