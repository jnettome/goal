json.array!(@trainings) do |training|
  json.extract! training, :id, :teacher_id, :name, :objective, :duration, :schedule, :body_group
  json.url training_url(training, format: :json)
end
