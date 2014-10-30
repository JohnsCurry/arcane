class Category < ActiveRecord::Base
  has_many :skill_categories
  has_many :skills, through: :skill_categories
  validates_presence_of :name
  validates_uniqueness_of :name
end
