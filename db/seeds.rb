category = ["Telecomunications", "Retail", "Airline"]

Company.destroy_all

puts "Starting the seed"

company = Company.new(name: "LeWagon", domain: "lewagon.com", location: "Barcelona")
p company.name
p company.domain
company.save

company = Company.new(name: "Amazon", domain: "Amazon.com", location: "USA")
company.save

puts "Ending the seed"

