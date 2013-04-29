class User < ActiveRecord::Base
  
  mount_uploader :image, UserImageUploader 
    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :invitable

  scope :order_by, lambda { |o| {:order => o} }  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone, :image, :combined_name, :admin, :domain, :memberships_attributes
  # attr_accessible :title, :body
  
  has_many :memberships, :dependent => :destroy
  has_many :projects, :through => :memberships
  has_many :owned, :class_name => "Project", :foreign_key => "owner_id"
  
  accepts_nested_attributes_for :memberships
    
  before_save :combined_name
  before_save :domain    
  
  def combined_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def phone=(phone)
    write_attribute(:phone, phone.gsub(/\D/, ''))
  end
  
  def domain
    write_attribute(:domain, email.split("@").last.split(".").first.to_s)
  end
  
end
