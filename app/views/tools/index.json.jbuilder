json.array!(@tools) do |tool|
  json.extract! tool, :id, :name, :desc, :cmd, :p1, :p1_desc, :p2, :p2_desc, :p3, :p3_desc, :p4, :p4_desc, :o1, :o1_desc, :o2, :o2_desc, :o3, :o3_desc, :o4, :o4_desc
  json.url tool_url(tool, format: :json)
end
