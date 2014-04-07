class RenameJoin < ActiveRecord::Migration
  def change
    rename_table :stops, :lines_stations
  end
end
