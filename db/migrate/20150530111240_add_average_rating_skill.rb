class AddAverageRatingSkill < ActiveRecord::Migration
  def change
    add_column :skills, :average, :float
  end
end
