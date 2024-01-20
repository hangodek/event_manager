require 'csv'
puts 'EventManager initialized.'

contents = CSV.open('/home/han/Godek/event_manager/event_attendees.csv', headers: true)
contents.each do |row|
  name = row[2]
  puts name
end