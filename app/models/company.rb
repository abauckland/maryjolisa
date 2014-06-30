class Company < ActiveRecord::Base
  has_many :users
  mount_uploader :logo, LogoUploader
    
  geocoded_by :postcode
  after_validation :geocode, :if => :postcode_changed?  
end
