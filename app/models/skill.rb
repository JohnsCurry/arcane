class Skill < ActiveRecord::Base
  has_many :reviews, -> { order("created_at DESC") }
  has_many :skill_categories
  has_many :categories, through: :skill_categories
  validates_presence_of :description, :title, :url
#  validates :description, presence: true
#  validates :title, presence: true

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
  end
end
