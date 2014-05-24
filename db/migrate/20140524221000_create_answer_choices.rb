class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.string :choice, null: false
      t.integer :question_id, null: false
      t.integer :value, null: false

      t.timestamps
    end

    add_index :answer_choices, :question_id
  end
end
