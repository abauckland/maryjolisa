class User < ActiveRecord::Base
  belongs_to :company

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :lockable,
    :encryptable, :encryptor => "authlogic_sha512"

  #declare an enum attribute where the values map to integers in the database, but can be queried by name
  enum role: [:admin, :owner, :employee]

  accepts_nested_attributes_for :company

  def name
    return first_name+' '+surname
  end

end
