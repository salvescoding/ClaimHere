name = ["Amazon", "MediaMarkt", "Movistar", "Jazztel", "Vodafone", "Iberia", "Vueling"]
location = ["Barcelona", "Madrid", "Online"]
category = ["Telecomunications", "Retail", "Airline"]

Company.destroy_all

puts "Starting the seed"

10.times do
  company = Company.new(name: name.sample, location: location.sample, category: category.sample)
  company.save
  company.name
end

puts "Ending the seed"

