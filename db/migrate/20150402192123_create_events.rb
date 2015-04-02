class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :eventid
      t.string :team
      t.string :player

      t.timestamps null: false
    end
  end
end
