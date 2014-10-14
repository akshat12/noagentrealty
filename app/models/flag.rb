# app/models/flag.rb

# For profanity filtering
require 'obscenity/active_model'

class Flag < ActiveRecord::Base
  belongs_to :user
  belongs_to :flaggable, :polymorphic => true
  
  attr_accessible :comment, :reason

  # String sanitization
  before_validation :sanitize_flag

  # Data validation
  validates :user_id, :presence => true
  validates :flaggable_id, :presence => true, :uniqueness => { :scope => [:flaggable_type, :user_id] }
  validates :reason, :presence => true, :obscenity => true, :length => { :maximum => 255 }
  validates :comment, :presence => true, :obscenity => true

  def sanitize_flag
    # Sanitize flag fields unless the field is blank
  	self.reason = Sanitize.clean(self.reason).gsub('&amp;','&').gsub('&gt;', '>') unless self.reason.blank?
    self.comment = Sanitize.clean(self.comment).gsub('&amp;','&').gsub('&gt;', '>') unless self.comment.blank?
  end

end
