require 'pry'

class CreditCheck
  attr_accessor :card_number

  def initialize(card_number)
    @card_number = card_number
  end

end
