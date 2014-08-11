json.array!(@mayors) do |mayor|
  json.extract! mayor, :id, :name, :age
  json.url mayor_url(mayor, format: :json)
end
