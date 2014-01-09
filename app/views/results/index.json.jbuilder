json.array!(@results) do |result|
  json.extract! result, :id, :task_id, :return, :stdout, :of1, :of2, :of3, :of4
  json.url result_url(result, format: :json)
end
