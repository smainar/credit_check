require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require 'pry'

class CreditCheckTest < Minitest::Test
  def setup
    @credit_check = CreditCheck.new("5541808923795240")
  end

  def test_it_exists
    assert_instance_of CreditCheck, @credit_check
  end

  def test_it_begins_with_a_card_number
    assert_equal "5541808923795240", @credit_check.card_number
  end

  def test_it_can_separate_card_number_by_single_digits
    assert_equal [5, 5, 4, 1, 8, 0, 8, 9, 2, 3, 7, 9, 5, 2, 4, 0], @credit_check.single_digits
  end

  def test_it_can_double_the_value_of_every_other_digit
    assert_equal [10, 5, 8, 1, 16, 0, 16, 9, 4, 3, 14, 9, 10, 2, 8, 0], @credit_check.every_other_digit_is_doubled
  end

  def test_it_can_sum_digits_greater_than_9
    assert_equal [1, 5, 8, 1, 7, 0, 7, 9, 4, 3, 5, 9, 1, 2, 8, 0], @credit_check.double_digits_are_summed
  end

  def test_it_can_sum_all_the_digits
    assert_equal 70, @credit_check.results_summed
  end

  def test_it_is_divisible_by_10
    assert_equal true, @credit_check.divisible_by_10?
  end

  def test_it_can_check_validation_and_return_appropriate_message
    assert_equal "The number 5541808923795240 is valid!", @credit_check.check_validation
    assert_equal "The number 6011797668868728 is invalid!", @credit_check.check_validation
  end

end
