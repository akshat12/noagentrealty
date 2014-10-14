# app/models/event.rb

# For profanity filtering
require 'obscenity/active_model'

class Event < ActiveRecord::Base
  belongs_to :user
  has_one :location, :as => :locatable, :dependent => :destroy
  has_many :flags, :as => :flaggable, :dependent => :destroy

  accepts_nested_attributes_for :location

  attr_accessible :description, :end_time, :event_date, :image, :image_cache, :remove_image, :location_attributes, :name, :start_time

  # For uploading images
  mount_uploader :image, ImageUploader

  # String sanitization
  before_validation :sanitize_event

  # Data validation
  validates :user_id, :presence => true
  validates :name, :presence => true, :obscenity => true, :length => { :maximum => 255 }
  validates :description, :presence => true, :obscenity => true
  validates :event_date, :presence => true
  validates :start_time, :presence => true

  # Ensure location is not empty
  validate :check_location
  
  # Date/Time validation
  validates_time :end_time, :after => :start_time ,:if => "!end_time.nil?", :after_message => "must be after start time"
  validates_date :event_date, :on_or_after => Date.today, :on_or_after_message => "must be on or after today"

  # Check if location is empty
  def check_location
    if self.location.address.blank?
      errors.add(:location, "can't be blank")
    end
  end

  def sanitize_event
    # Sanitize event fields unless the field is blank
    self.name = Sanitize.clean(self.name).gsub('&amp;','&').gsub('&gt;', '>') unless self.name.blank?
    self.description = Sanitize.clean(self.description).gsub('&amp;','&').gsub('&gt;', '>') unless self.description.blank?
    self.location.address = Sanitize.clean(self.location.address).gsub('&amp;','&').gsub('&gt;', '>') unless self.location.address.blank?
  end
  
end
