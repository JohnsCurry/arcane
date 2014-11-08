class AddBannerToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :banner, :text
  end
end
