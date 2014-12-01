# app/models/wish_list.rb

# For profanity filtering
require 'obscenity/active_model'

class WishList < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :description, :property_type, :postal_code, :rent, :number_of_bathrooms, :number_of_rooms, :number_of_study, :lease_duration, :unit_number, :furnished?
  
  # String sanitization
  before_validation :sanitize_wish_list

  # Data validation
  validates :name, :presence => true, :obscenity => true, :length => { :maximum => 255 }
  validates :property_type, :presence => true, :obscenity => true, :length => { :maximum => 255 }
  validates :postal_code, :length => { :maximum => 255 }
  validates :number_of_bathrooms, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :number_of_study, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!length.nil?"
  validates :number_of_rooms, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!width.nil?"

  validates :lease_duration, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!weight.nil?"

  validates :rent, :numericality => { :only_integer => false, :greater_than_or_equal_to => 0 }, :if => "!price.nil?"

 
  def sanitize_wish_list
    # Sanitize wish list fields unless the field is blank
    self.name = Sanitize.clean(self.name).gsub('&amp;','&').gsub('&gt;', '>') unless self.name.blank?
    self.description = Sanitize.clean(self.description).gsub('&amp;','&').gsub('&gt;', '>') unless self.description.blank?
    self.property_type = Sanitize.clean(self.category).gsub('&amp;','&') unless self.category.blank?
    self.location = Sanitize.clean(self.location).gsub('&amp;','&').gsub('&gt;', '>') unless self.location.blank?
  end

end