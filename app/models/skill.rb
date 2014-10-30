class Skill < ActiveRecord::Base
  has_many :skill_categories
  has_many :categories, through: :skill_categories
  validates :description, presence: true
  validates :url, presence: true
  validates :title, presence: true

  def self.sort_all_my_skills
    left = []
    middle = []
    right = []
    Skill.all.each do |skill|
      if left.size == middle.size && left.size == right.size
        left.push skill
      elsif left.size > middle.size
        middle.push skill
      else
        right.push skill
      end
    end
    return left, middle, right
    binding.pry
  end
end
