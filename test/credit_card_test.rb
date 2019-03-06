require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_card'
require 'pry'

class CreditCardClass
  def setup
    @credit_card = CreditCard.new("5541808923795240", 15000)
  end

  def test_it_exists
    assert_instance_of CreditCard, @credit_card
  end

  def test_it_has_a_card_number
    assert_equal "5541808923795240", @credit_card.card_number
  end

  def test_it_has_a_limit
    assert_equal 15000, @credit_card.limit
  end

  def test_the_last_four_digits
    assert_equal "5240", @credit_card.last_four
  end

  def test_it_is_valid
    assert_equal true, @credit_card.is_valid?
  end

end
