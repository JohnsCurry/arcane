class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.integer :category_id
      t.integer :skill_id
    end
  end
end
