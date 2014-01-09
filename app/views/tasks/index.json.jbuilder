json.array!(@tasks) do |task|
  json.extract! task, :id, :owner, :desc, :tool_id, :configure_id, :result_id, :state
  json.url task_url(task, format: :json)
end
