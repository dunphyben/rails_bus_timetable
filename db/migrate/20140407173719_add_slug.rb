class AddSlug < ActiveRecord::Migration
  def change
    add_column :lines, :slug, :string
    add_index :lines, :slug
    add_column :stations, :slug, :string
    add_index :stations, :slug
  end
end
