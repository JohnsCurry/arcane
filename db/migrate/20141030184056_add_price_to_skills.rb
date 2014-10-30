class AddPriceToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :price, :string
  end
end
