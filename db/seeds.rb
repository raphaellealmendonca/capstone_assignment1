@searchCity = City.find_by_name('Baltimore')
if @searchCity.blank?
  cities = City.create([{ name: 'Baltimore' }])
end

@searchState = State.find_by_name('Maryland')
if @searchState.blank?
  states = State.create([{ name: 'Maryland' }])
end
