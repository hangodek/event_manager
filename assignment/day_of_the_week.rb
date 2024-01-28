require "csv"
require "date"
puts "System Initialized"
myArr = []

myFile = CSV.open("/home/han/Belajar/event_manager/assignment/event_attendees.csv")

myFile.each do |x|
    if x[1] == "RegDate"
        next
    end
    temp = x[1].split(/[\/\s]/)
    temp.pop
    
    temp[1], temp[2] = temp[2], temp[1]
    temp.map! { |val| val.to_i }
    temp[0] += 2000
    
    myTime = Date.new(*temp)
    myArr.push(myTime)

end

myHash = {}
myArr.each do |x|
    temp = x.wday

    if myHash.include?(temp) == true
        myHash[temp] += 1
    elsif myHash.include?(temp) == false
        myHash[temp] = 1
    end
    
end

p myHash


