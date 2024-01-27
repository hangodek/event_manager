require "csv"
puts "System Initialized"
myArr = []

myFile = CSV.open("event_attendees.csv")
myFile.each do |x|
    if x[1] == "RegDate"
        next
    end

    temp = x[1].split(/[\/\s:]/)
    temp[0], temp[2] = temp[2], temp[0]
    temp[1], temp[2] = temp[2], temp[1]
    temp.map! { |val| val.to_i }
    temp[0] += 2000

    myTime = Time.new(*temp)
    myArr.push(myTime)
    
end

myHash = {}
myTimeNew = myArr.sort
myTimeNew.map do |x|
    temp = x.strftime("%H")
    
    if myHash.include?(temp) == true
        myHash[temp] += 1
    elsif myHash.include?(temp) == false
        myHash[temp] = 1
    end
end

p myHash

