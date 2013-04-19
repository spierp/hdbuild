class Project < ActiveRecord::Base

  attr_accessible :address, :name, :owner_id, :project_number, :location, :longitude, :latitude, :description, :construction_start, 
  :construction_finish, :memberships_attributes, :milestones_attributes, :owner, :slug, :privatelink

  def to_param
    slug
  end  
  
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  has_many :members, :through => :memberships, :source => :user
  accepts_nested_attributes_for :users, :reject_if => lambda { |a| a[:first_name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :memberships, :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true
  
  has_many :milestones, :dependent => :destroy
  accepts_nested_attributes_for :milestones, :reject_if => lambda { |a| a[:date].blank? }, :allow_destroy => true  
  
  validates :slug, uniqueness: true, presence: true,
                  exclusion: {in: %w[users about admin]}
  
  validates_presence_of :name, :address, :memberships
  
  before_validation :generate_slug
  before_validation :generate_privatelink  
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  def generate_privatelink
    self.privatelink ||= SecureRandom.urlsafe_base64(n = 3)
  end
  
  def generate_slug
    self.slug = "#{privatelink}-#{name.parameterize}"
  end
  
end
