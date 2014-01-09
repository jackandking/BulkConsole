json.array!(@results) do |result|
  json.extract! result, :id, :task_id, :return, :stdout, :logfile, :errfile
  json.url result_url(result, format: :json)
end
