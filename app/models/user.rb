class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone, :image, :combined_name, :admin
  # attr_accessible :title, :body
  
  
  
  before_save :combined_name
  
  scope :order_by, lambda { |o| {:order => o} }  
  
  def combined_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def phone=(phone)
    write_attribute(:phone, phone.gsub(/\D/, ''))
  end
  
end
