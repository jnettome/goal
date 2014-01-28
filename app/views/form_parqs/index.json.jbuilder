json.array!(@form_parqs) do |form_parq|
  json.extract! form_parq, :id, :user_id, :answer1, :answer, :answer3, :answer4, :answer5, :answer6, :answer7
  json.url form_parq_url(form_parq, format: :json)
end
