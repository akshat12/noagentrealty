# app/models/preference.rb

class Preference < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :preference_value
end
