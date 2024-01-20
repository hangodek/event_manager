require "csv"
puts "Test"

contents = CSV.open(
    "/home/han/Godek/event_manager/event_attendees.csv",
    headers: true,
    header_converters: :symbol
)

contents.each do |x|
    name = x[:first_name]
    zipcode = x[:zipcode]
    p zipcode
end