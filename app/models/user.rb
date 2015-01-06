class User < ActiveRecord::Base

  include AASM

  belongs_to :company

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :lockable,
    :encryptable, :encryptor => "authlogic_sha512"

  #declare an enum attribute where the values map to integers in the database, but can be queried by name
  enum role: [:admin, :owner, :employee]

  accepts_nested_attributes_for :company

  aasm :column => 'state' do

    state :active, :initial => true
    state :inactive

    event :deactivate do
      transitions :from => :active, :to => :inactive
    end

    event :activate do
      transitions :from => :inactive, :to => :active
    end
  end

  def name
    return first_name+' '+surname
  end

  def phone_number
    tel.unpack('A4A3A4').join(' ')
  end

end
