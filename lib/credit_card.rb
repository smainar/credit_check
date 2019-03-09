require 'pry'

class CreditCard
  attr_reader :card_number,
              :limit

  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
  end

  def last_four
    @card_number[-4..-1]
  end

  def is_valid?
    credit_check = CreditCheck.new(card_number)
    if credit_check.divisible_by_10? == true
      return true
    else
      return false
    end
  end

end
