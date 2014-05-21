class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username, null: false
      t.integer :age, null: false
      t.string :gender, null: false
      t.string :location, null: false
      t.text :summary
      t.text :skills
      t.text :interests
      t.text :life_direction
      t.text :goals
      t.integer :user_id, null: false
      t.string :height
      t.string :body_type
      t.string :drinks
      t.string :job
      t.string :income

      t.timestamps
    end

    add_index :profiles, :interests
    add_index :profiles, :username
  end
end
