class AddImage < ActiveRecord::Migration
  def change
    add_column :skills, :image, :string
  end
end
