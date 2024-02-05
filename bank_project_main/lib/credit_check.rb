require './bank.rb'
require 'pry'
#JUST REPLACE WITH REQUIRE BANK.RB AFTER DONE

card_number = "5541808923795240" #valid
#Valid: 5541808923795240, 4024007136512380, 6011797668867828
#Invalid: 5541801923795240, 4024007106512380, 6011797668868728
#5 5 4 1  8 0 8 9  2 3 7 9  5 2 4 0
#10 5 8 1 16 0 16 9 4 3 14 9 10 2 8 0
#10 16 16 14 10 
#join ^^ into a string
#split again 
#add every other entry together 

class CreditCheck
  
  def initialize(card_number,limit)
    @card_number = card_number
    @limit = limit
  end

  def card_number
    @card_number
  end

  def limit
    @limit
  end

  def is_valid?
    card_arr = @card_number.split("")
    #splits into an array of strings
    card_arr.map!.each do |i|
      i.to_i
    end
    #turns those strings into integers
    card_arr.map!.each_with_index do |item, index|
      if index % 2 == 0
        item * 2
      else 
        item * 1
      end 
    end
    card_odd_nums = []

    card_arr.each_with_index do |item, index|
      unless index % 2 == 0
       card_odd_nums.push(item)
      end
 print card_odd_nums
    end
    #doubles every other value including the first and sends those not doubled to a separate array for addition later
    card_sum = []

    card_arr.each.map do |i|
      if i >= 10 
        card_sum.push(i)
        #card_sum.join("")
      end
    end

    #used chatgpt to find out how to sum every 2 numbers, gpt returned each_slice full chat down below pretty useless though
    card_sum = card_sum.join("").split("")
    
    card_sum.map!.each do |i|
      i.to_i
    end

    card_digit_sum = []

    # card_sum.map!.each_with_index do |item, index|
    #   sum = [item] + [item + 1]
    #   card_digit_sum.push(sum)
    #   card_sum.delete([0])
    #   card_sum.delete([0])
    # end 
    # card_sum.map!.each_with_index do |item, index|
     
      card_digit_sum = card_sum.each_slice(2) do |a|
        sum_a = a.sum
        card_digit_sum.push(sum_a)
        card_sum_arr = []
        card_sum_arr.push(sum_a)
        sum_a.to_s.split("")
        
         
      end


      
      # print card_digit_sum
      
    # end
    
    # return card_sum
    # print card_digit_sum
    # print card_sum
  end

  def last_four
    card_arr = @card_number.to_s.split("")
    return card_arr.last(4).join("")
  end
end

puts CreditCheck.new("5541808923795240",15000).is_valid?

#inject each of the new values into every odd numbered index if said index is above 9

#something simple that can be capitalized on early

# GPT LOG
# in an array in ruby, how can i sum every 2 numbers within an array? 

# so for example [1,0,2,5,1,6]
# turns into [1,7,7]
# ChatGPT
# You can achieve this by iterating through the array and summing every two consecutive numbers. Here's an example in Ruby:

# ruby
# Copy code
# def sum_every_two_numbers(array)
#   result = []
  
#   array.each_slice(2) do |pair|
#     result << pair.sum
#   end
  
#   result
# end

# input_array = [1, 0, 2, 5, 1, 6]
# result_array = sum_every_two_numbers(input_array)

# puts result_array.inspect
# This code uses the each_slice method to iterate through the array in pairs. For each pair, it calculates the sum and adds it to the result array. The final result will be [1, 7, 7].













# card_num_arr = card_number.split("")
# def card_check
#   card_num_arr.each_with_index do |item, index|
#     if (index % 2 != 0) 
#       item * 2
#     end 
#     return card_num_arr
#     print card_num_arr
#   end
# end

# print card_check
