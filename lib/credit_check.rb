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

end
