json.array!(@configures) do |configure|
  json.extract! configure, :id, :task_id, :s1, :s2, :s3, :s4, :if1, :if2, :if3, :if4
  json.url configure_url(configure, format: :json)
end
