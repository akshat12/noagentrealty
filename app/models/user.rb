# app/models/user.rb

# For profanity filtering
require 'obscenity/active_model'

# The MIT License
# Copyright (c) 2012 Michael Hartl
# http://opensource.org/licenses/mit-license.php

# /*
#  * ----------------------------------------------------------------------------
#  * "THE BEER-WARE LICENSE" (Revision 42):
#  * Michael Hartl wrote this code. As long as you retain this notice you
#  * can do whatever you want with this stuff. If we meet some day, and you think
#  * this stuff is worth it, you can buy me a beer in return.
#  * ----------------------------------------------------------------------------
#  */

class User < ActiveRecord::Base
  has_many :items, :dependent => :destroy
  has_many :projects, :dependent => :destroy
  has_many :wish_lists, :dependent => :destroy
  has_many :flags, :dependent => :destroy
  has_many :flags, :as => :flaggable, :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :preferences, :dependent => :destroy
  has_many :news, :dependent => :destroy

  attr_accessible :name, :email, :curr_password, :password, :password_confirmation, :confirmed, :confirm_code, :image, :image_cache, :remove_image

  # For password encryption
  has_secure_password

  # For uploading images
  mount_uploader :image, ImageUploader
  
  # String sanitization
  before_validation :sanitize_user

  # Convert user's email to downcase
  before_save { |user| user.email = email.downcase }
  # Create remember token for user session
  before_save :create_remember_token
  # Create confirmation code for new accounts
  before_save :create_confirm_code

  # Data validation
  validates :name,	:presence => true, :obscenity => true, :length => { :maximum => 50 }
  
  # Regular expression to ensure valid email format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX },
  					:uniqueness => { :case_sensitive => false },
            :length => { :maximum => 100 }

  validates :password, :presence => true, :length => { :minimum => 6 }

  # send_password_reset
  # Copyright (c) 2008 Ryan Bates
  def send_password_reset
    # Generate password reset token
    self.password_reset_token = SecureRandom.urlsafe_base64
    # Set timestamp of when password reset was sent
    self.password_reset_sent_at = Time.zone.now
    # Do not run data validation upon saving the user
    save!(validate: false)
    # Notify the user that password reset instructions have been sent to their email
    UserMailer.password_reset(self).deliver
  end

  private

    # Generate remember token for user session
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end

    # Generate confirmation code for new accounts
    def create_confirm_code
  		self.confirm_code = SecureRandom.urlsafe_base64
  	end

    # Sanitize user's name unless the field is blank
    def sanitize_user
      self.name = Sanitize.clean(self.name).gsub('&amp;','&').gsub('&gt;', '>') unless self.name.blank?
    end
end
