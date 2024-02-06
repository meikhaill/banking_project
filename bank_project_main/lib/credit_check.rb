require './bank.rb'
require 'pry'
require 'minitest/autorun'
# require_relative '../lib/bank.rb'
require_relative '../test/bank_test.rb'


card_number = "4024007106512380" #valid
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
    card_arr.map!.each do |i|
      i.to_i
    end
   
    card_arr.map!.each_with_index do |item, index|
      if index % 2 == 0
        item * 2
      else 
        item * 1
      end 
    end

    card_arr.map!.each_with_index do |item, index|
      if index % 2 == 0 && item >= 10
        item - 9
      else
        item * 1
      end
    end

    card_arr = card_arr.sum
    print card_arr
    card_arr % 10 == 0 ? true : false
   end

  def last_four
    card_arr = @card_number.to_s.split("")
    card_arr = card_arr.last(4).join("")
    return card_arr
  end
end

puts CreditCheck.new("5541808923795240",15000).is_valid?


