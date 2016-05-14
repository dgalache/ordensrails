json.array!(@cargos) do |cargo|
  json.extract! cargo, :id, :tipo, :salario
  json.url cargo_url(cargo, format: :json)
end
