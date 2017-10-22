@searchCity = City.find_by_name('Baltimore')
if @searchCity.blank?
  cities = City.create([{ name: 'Baltimore' }])
end

state = State.new(
  name: "Maryland"
)
state.upsert
