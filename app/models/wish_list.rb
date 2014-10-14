# app/models/wish_list.rb

# For profanity filtering
require 'obscenity/active_model'

class WishList < ActiveRecord::Base
  belongs_to :user
  attr_accessible :category, :location, :name, :description, :condition, :quantity, :length, :width, :height, :price, :weight, :available_until
  
  # String sanitization
  before_validation :sanitize_wish_list

  # Data validation
  validates :name, :presence => true, :obscenity => true, :length => { :maximum => 255 }
  validates :category, :presence => true, :obscenity => true, :length => { :maximum => 255 }
  validates :condition, :presence => true, :obscenity => true, :length => { :maximum => 255 }
  validates :location, :obscenity => true, :if => "!location.nil?", :length => { :maximum => 255 }
  validates :quantity, :presence => true,
   :numericality => { :only_integer => true, :greater_than => 0 }
  validates :length, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!length.nil?"
  validates :width, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!width.nil?"
  validates :height, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!height.nil?"

  validates :weight, :numericality => { :only_integer => false, :greater_than => 0 }, :if => "!weight.nil?"

  validates :price, :numericality => { :only_integer => false, :greater_than_or_equal_to => 0 }, :if => "!price.nil?"

   validates :available_until, :presence => true
  
  # Date validation
  validates_date :available_until, :on_or_after => Date.current, :on_or_after_message => "date must be after today"
  
  def sanitize_wish_list
    # Sanitize wish list fields unless the field is blank
    self.name = Sanitize.clean(self.name).gsub('&amp;','&').gsub('&gt;', '>') unless self.name.blank?
    self.description = Sanitize.clean(self.description).gsub('&amp;','&').gsub('&gt;', '>') unless self.description.blank?
    self.category = Sanitize.clean(self.category).gsub('&amp;','&') unless self.category.blank?
    self.condition = Sanitize.clean(self.condition).gsub('&amp;','&') unless self.condition.blank?
    self.location = Sanitize.clean(self.location).gsub('&amp;','&').gsub('&gt;', '>') unless self.location.blank?
  end

end