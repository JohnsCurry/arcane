class SkillCategory < ActiveRecord::Base
  belongs_to :skill
  belongs_to :category
end
