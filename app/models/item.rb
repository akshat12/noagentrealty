# app/models/item.rb

# For profanity filtering
require 'obscenity/active_model'

class Item < ActiveRecord::Base

  belongs_to :user
  has_many :flags, :as => :flaggable, :dependent => :destroy
  has_one :location, :as => :locatable, :dependent => :destroy

  accepts_nested_attributes_for :location
  
  attr_accessible :category, :description, :image, :image_cache, :remove_image, :location_attributes, :name, :quantity, :condition, :length, :width, :height, :price, :available_from, :available_until, :weight

  # For uploading images
  mount_uploader :image, ImageUploader

  # String sanitization
  before_validation :sanitize_item

  # Data validation
  validates :user_id, :presence => true

  validates :name, :presence => true, :obscenity => true, :length => { :maximum => 255 }

  validates :description, :presence => true, :obscenity => true

  validates :category, :presence => true, :obscenity => true, :length => { :maximum => 255 }

  validates :condition, :presence => true, :obscenity => true, :length => { :maximum => 255 }

  # Optional Fields Begin

  validates :length, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!length.nil?"
  validates :width, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!width.nil?"
  validates :height, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!height.nil?"

  validates :weight, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!weight.nil?"

  validates :quantity, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }, :if => "!quantity.nil?"

  validates :price, :numericality => { :only_integer => false, :greater_than_or_equal_to => 0 }, :if => "!price.nil?"

  # Optional Fields End

  validates :available_from, :presence => true
  validates :available_until, :presence => true

  # Date Validation
  validates_date :available_until, :on_or_after =>:available_from, :after_message =>"must be set to after from date"
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
    self.category = Sanitize.clean(self.category).gsub('&amp;','&') unless self.category.blank?
    self.condition = Sanitize.clean(self.condition).gsub('&amp;','&') unless self.condition.blank?
    self.location.address = Sanitize.clean(self.location.address).gsub('&amp;','&').gsub('&gt;', '>') unless self.location.address.blank?
  end
  
end
