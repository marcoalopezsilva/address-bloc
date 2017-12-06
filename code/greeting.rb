def greeting 
    ARGV.each_with_index do |item, index|
        next if index == 0
        puts "#{ARGV[0]} #{item}"
    end
end 

greeting