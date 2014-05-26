json.extract! question, :title, :id, :created_at, :updated_at

json.answer_choices question.answer_choices, :id, :choice, :value, :question_id
