# app/models/project.rb

# For profanity filtering
require 'obscenity/active_model'

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :flags, :as => :flaggable, :dependent => :destroy

  attr_accessible :description, :image, :image_cache, :remove_image, :name

  # For uploading images
  mount_uploader :image, ImageUploader

  # String sanitization
  before_validation :sanitize_project

  # Data validation
  validates :user_id, :presence => true
  validates :name, :presence => true, :obscenity => true, :length => { :maximum => 255 }
  validates :description, :presence => true, :obscenity => true

  def sanitize_project
    # Sanitize project fields unless the field is blank
  	self.name = Sanitize.clean(self.name).gsub('&amp;','&').gsub('&gt;', '>') unless self.name.blank?
    self.description = Sanitize.clean(self.description).gsub('&amp;','&').gsub('&gt;', '>') unless self.description.blank?
  end
  
end
