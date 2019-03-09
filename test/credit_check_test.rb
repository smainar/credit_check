# The two require statements bring in the minitest autorun and pride gems, a unit testing framwork. It provides assertions to make your tests clean and readable.
require 'minitest/autorun'
require 'minitest/pride'

# This require lets this test file know about the credit_check file in the lib directory, so we can test the CreditCheck class
require './lib/credit_check'

# It opens a Pry session at the point it's called and makes all program state at that point available. The Pry session will then begin within the scope of the object (or binding).
require 'pry'

# all our tests for a class live in a test class. It inherits from the Minitest class (which we required on line 2)
class CreditCheckTest < Minitest::Test

  # The setup method is called before every test method runs. It can be used to set up fixture information. In this case, it creates an instance of credit_check that passes one argument, a card number that is a String
  def setup
    @credit_check = CreditCheck.new("5541808923795240")
  end

  # The test method must start with "test_" to run, and test name should describe the expected functionality
  def test_it_exists

    # Assert it is an instance of the CreditCheck class
    # On the left of the comma is the Expected value, and the right of the comma is the Actual value
    assert_instance_of CreditCheck, @credit_check
  end

  def test_it_begins_with_a_card_number

    # Assert that the String that was passed in as an argument is the same as the return value when we call .card_number
    # The instance variable is stored with the argument
    # I wrote an attr_accessor, which automatically sets up a getter and setter for this instance variable
    assert_equal "5541808923795240", @credit_check.card_number
  end

  def test_it_can_separate_card_number_by_single_digits

    # Assert that the card number began as a String, but was converted to an Integer
    # After converting the card number to an Integer, you interate over each number/digit so that they are separated individually into an array when calling the .single_digits method
    assert_equal [5, 5, 4, 1, 8, 0, 8, 9, 2, 3, 7, 9, 5, 2, 4, 0], @credit_check.single_digits
  end

  def test_it_can_double_the_value_of_every_other_digit

    # This method uses the Command (and helper method) .single_digits method listed above
    @credit_check.single_digits

    # Assert that when the .every_other_digit_is_doubled method is called, we return a new array with every other digit is doubled, just as the method name says

    # We take the array from the .single_digits method, iterate over each digit, and multiply every other digit by 2x beginning with the first digit
    assert_equal [10, 5, 8, 1, 16, 0, 16, 9, 4, 3, 14, 9, 10, 2, 8, 0], @credit_check.every_other_digit_is_doubled
  end

  def test_it_can_sum_digits_greater_than_9

    # This method uses the Commands (and helper methods): 1) .single_digits method, and 2) .every_other_digit_is_doubled method
    @credit_check.single_digits
    @credit_check.every_other_digit_is_doubled

    # Assert that when the .double_digits_are_summed method is called, we return a new array
    # We take the array from the .every_other_digit_is_doubled method, iterate over each digit
    # If the product of the 2x multiplication operation is greater than 9, then we sum the digits of that multiplication operation
    assert_equal [1, 5, 8, 1, 7, 0, 7, 9, 4, 3, 5, 9, 1, 2, 8, 0], @credit_check.double_digits_are_summed
  end

  def test_it_can_sum_all_the_digits

    # This method uses the Commands (and helper methods): 1) .single_digits method, 2) .every_other_digit_is_doubled method, and 3) .double_digits_are_summed method
    @credit_check.single_digits
    @credit_check.every_other_digit_is_doubled
    @credit_check.double_digits_are_summed

    # Assert that we call the .results_summed method, we return the value of 70
    # This is achieved when we sum all the digits from the array returned in the .double_digits_are_summed method
    assert_equal 70, @credit_check.results_summed
  end

  def test_it_is_divisible_by_10

    # This method uses the Commands (and helper methods): 1) .single_digits method, 2) .every_other_digit_is_doubled method, 3) .double_digits_are_summed method, and 4) .results_summed
    @credit_check.single_digits
    @credit_check.every_other_digit_is_doubled
    @credit_check.double_digits_are_summed
    @credit_check.results_summed

    # Assert that we call the .divisible_by_10? method, we return the boolean with a true value
    # We take the output from the .results_summed method, divide it by the modulo of 10, and check that the Remainder is 0
    assert_equal true, @credit_check.divisible_by_10?
  end

  def test_it_can_check_validation_and_return_output

    # This method uses the Commands (and helper methods): 1) .single_digits method, 2) .every_other_digit_is_doubled method, 3) .double_digits_are_summed method, 4) .results_summed, and 5) .divisible_by_10?
    @credit_check.single_digits
    @credit_check.every_other_digit_is_doubled
    @credit_check.double_digits_are_summed
    @credit_check.results_summed
    @credit_check.divisible_by_10?

    # Asserts that the message  "The number 5541808923795240 is valid!" will be returned when the .check_validation method is called because the card number is valid and passes all the criteria of the Command methods listed above
    assert_equal "The number 5541808923795240 is valid!", @credit_check.check_validation

    # It creates an instance of credit_card so we can test it.
    # It passes one argument, an invalid card number that is a String
    credit_check = CreditCheck.new("6011797668868728")

    # This method uses the Commands (and helper methods): 1) .single_digits method, 2) .every_other_digit_is_doubled method, 3) .double_digits_are_summed method, 4) .results_summed, and 5) .divisible_by_10?
    credit_check.single_digits
    credit_check.every_other_digit_is_doubled
    credit_check.double_digits_are_summed
    credit_check.results_summed
    credit_check.divisible_by_10?

    # Asserts that the message  "The number 6011797668868728 is valid!" will be returned when the .check_validation method is called because the card number is invalid and does NOT pass all the criteria of the Command methods listed above
    assert_equal "The number 6011797668868728 is invalid!", credit_check.check_validation
  end

end
