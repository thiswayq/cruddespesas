json.array!(@despesas) do |despesa|
  json.extract! despesa, :id, :data, :time, :description, :amount, :comment
  json.url despesa_url(despesa, format: :json)
end
