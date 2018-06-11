json.array!(@events) do |event|
  json.extract! event, :action, :created_at
end
