require 'pry'

class CreditCheck
  attr_accessor :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def single_digits
    @card_number.chars.map do |single_digit|
      single_digit.to_i
    end
  end

  def every_other_digit_is_doubled
    doubled_digits_array = []
    single_digits.each_with_index do |digit, index|
      if index.even?
        doubled_digits_array << digit * 2
      else
        doubled_digits_array << digit
      end
    end
    return doubled_digits_array
  end

  def double_digits_are_summed
    doubled_digits_summed_array = []
    every_other_digit_is_doubled.each do |digit|
      if digit > 9
        doubled_digits_summed_array << digit - 9
      else
        doubled_digits_summed_array << digit
      end
    end
    return doubled_digits_summed_array
  end

end
