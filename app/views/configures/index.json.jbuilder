json.array!(@configures) do |configure|
  json.extract! configure, :id, :task_id, :s1, :s2, :s3, :s4, :f1, :f2, :f3, :f4
  json.url configure_url(configure, format: :json)
end
