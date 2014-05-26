class CreateAnsweredQuestions < ActiveRecord::Migration
  def change
    create_table :answered_questions do |t|
      t.integer :profile_id, null: false
      t.integer :question_id, null: false
      t.integer :answer_id, null: false

      t.timestamps
    end

    add_index :answered_questions, :profile_id
    add_index :answered_questions, :question_id
  end
end
