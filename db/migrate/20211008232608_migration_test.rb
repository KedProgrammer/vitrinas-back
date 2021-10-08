class MigrationTest < ActiveRecord::Migration[5.2]
  def change
    create_table :cars
  end
end
