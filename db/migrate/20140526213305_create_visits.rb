class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.integer :profile_id, null: false

      t.timestamps
    end

    add_index :visits, :profile_id
    add_index :visits, [:profile_id, :visitor_id]
  end
end
