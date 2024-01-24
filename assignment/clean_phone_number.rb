require 'csv'
puts "System initialized"
temp = []

myFile = CSV.open("event_attendees.csv")
myFile.each do |x|
    if x[5] == "HomePhone"
        next
    end
    temp.push(x[5])
end

temp.each do |x|
    x.gsub!(/[-\(\).+]/, "")
    x.gsub!(/[\s]/, "")
    if x.length < 10
        puts "#{x} Is a bad number"
    elsif x.length == 10
        puts "#{x} Is a good number"
    elsif x.length == 11 && x[0] == "1"
        x.gsub!(/[1]/, "")
        puts "#{x} Is a good number"
    elsif x.length == 11 && x[0] != "1"
        puts "#{x} Is a bad number"
    elsif x.length > 11
        puts "#{x} Is a bad number"
    end
end