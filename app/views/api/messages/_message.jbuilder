json.extract!(
  message,
  :id,
  :sender_id,
  :receiver_id,
  :title,
  :body,
  :created_at,
  :updated_at
)
json.sender message.sender.username
