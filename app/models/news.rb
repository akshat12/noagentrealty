# app/models/news.rb

# For profanity filtering
require 'obscenity/active_model'

class News < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :image, :image_cache, :remove_image, :title

  # For uploading images
  mount_uploader :image, ImageUploader

  # Data validation
  validates :title, :presence => true, :length => { :maximum => 255 }
  validates :content, :presence => true
end
