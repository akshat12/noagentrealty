# app/models/properties.rb

# For profanity filtering
require 'obscenity/active_model'

class RentalProperties < ActiveRecord::Base

  belongs_to :user
  has_many :flags, :as => :flaggable, :dependent => :destroy
  has_one :postal_code, :as => :locatable, :dependent => :destroy

  #accepts_nested_attributes_for :location
  
  attr_accessible :property_type, :description, :image, :image_cache, :remove_image, :postal_code, :name, :rent, :available_from, :number_of_bathrooms, :number_of_rooms, :number_of_study, :lease_duration, :postal_code, :unit_number, :furnished?

  # For uploading images
  mount_uploader :image, ImageUploader

  # String sanitization
  before_validation :sanitize_item

  # Data validation
  validates :user_id, :presence => true

  validates :name, :presence => true, :obscenity => true, :length => { :maximum => 255 }

  validates :description, :presence => true, :obscenity => true

  validates :property_type, :presence => true, :obscenity => true, :length => { :maximum => 255 }

 #<% # validates :condition, :presence => true, :obscenity => true, :length => { :maximum => 255 } %>

  # Optional Fields Begin

  validates :number_of_bathrooms, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!length.nil?"
  validates :number_of_rooms, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!width.nil?"
  validates :number_of_study, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!height.nil?"

  validates :lease_duration, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }, :if => "!quantity.nil?"

  validates :rent, :numericality => { :only_integer => false, :greater_than_or_equal_to => 0 }, :if => "!price.nil?"

  # Optional Fields End

  validates :available_from, :presence => true

  # Date Validation
  validates_date :available_from, :on_or_after => Date.today, :on_or_after_message => "date must be on or after today"
 
  # For item statistics 
  def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
		  csv << column_names
		  all.each do |item|
		  	csv << item.attributes.values_at(*column_names)
		  end
	  end
  end

  def sanitize_item
    # Sanitize item fields unless the field is blank
    self.name = Sanitize.clean(self.name).gsub('&amp;','&').gsub('&gt;', '>') unless self.name.blank?
    self.description = Sanitize.clean(self.description).gsub('&amp;','&').gsub('&gt;', '>') unless self.description.blank?
    self.property_type = Sanitize.clean(self.category).gsub('&amp;','&') unless self.category.blank?
    self.condition = Sanitize.clean(self.condition).gsub('&amp;','&') unless self.condition.blank?
    #self.location.address = Sanitize.clean(self.location.address).gsub('&amp;','&').gsub('&gt;', '>') unless self.location.address.blank?
  end
  
end
