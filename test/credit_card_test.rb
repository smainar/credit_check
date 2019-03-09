# The two require statements bring in the minitest autorun and pride gems, a unit testing framwork. It provides assertions to make your tests clean and readable.
require 'minitest/autorun'
require 'minitest/pride'

# This require lets this test file know about the credit_card file in the lib directory, so we can test the CreditCard class
require './lib/credit_card'

# This require lets this test file know about the credit_check file in the lib directory, so we have access to the CreditCheck class
require './lib/credit_check'

# It opens a Pry session at the point it's called and makes all program state at that point available. The Pry session will then begin within the scope of the object (or binding).
require 'pry'

# All of our tests for a class live in a test class. It inherits from the Minitest class (which we required on line 2)
class CreditCardClass < Minitest::Test

  # The setup method is called before every test method runs. It can be used to set up fixture information. In this case, it creates an instance of credit_card that passes two arguments, a card number that is a String and a card limit that is an Integer.
  def setup
    @credit_card = CreditCard.new("5541808923795240", 15000)
  end

  # The test method must start with "test_" to run, and test name should describe the expected functionality
  def test_it_exists

    # Assert it is an instance of the CreditCard class
    # On the left of the comma is the Expected value, and the right of the comma is the Actual value
    assert_instance_of CreditCard, @credit_card
  end

  def test_it_has_a_card_number

    # Assert that the String that was passed in as an argument is the same as the return value when we call .card_number
    # The instance variable is stored with the argument
    # I wrote an attr_reader, which automatically sets up a getter for this instance variable
    assert_equal "5541808923795240", @credit_card.card_number
  end

  def test_it_has_a_limit
    # Assert that the String that was passed in as an argument is the same as the return value when we call .card_number
    # The instance variable is stored with the argument
    # I wrote an attr_reader, which automatically sets up a getter for this instance variable
    assert_equal 15000, @credit_card.limit
  end

  def test_the_last_four_digits

    # This method asserts that the end of the last four digits of the credit card, "5240", will be returned when I call the method .last_four
    assert_equal "5240", @credit_card.last_four
  end

  def test_it_wiLl_return_true_if_valid

    # This method asserts that a boolean with a true value will be returned when I call the method .is_valid?

    # In Ruby, a boolean refers to a value of either true or false , both of which are defined as their very own data types. Every appearance, or instance, of true in a Ruby program is an instance of TrueClass, while every appearance of false is an instance of FalseClass
    assert_equal true, @credit_card.is_valid?
  end

  def test_it_will_return_false_if_invalid

    # Creates an instance of an invalid credit card so we can test it
    invalid_credit_card = CreditCard.new("6011797668868728", 15000)

    # This method asserts that a boolean with a false value will be returned when I call the method .is_valid?
    assert_equal false, invalid_credit_card.is_valid?
  end

end
