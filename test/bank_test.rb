# The two require statements bring in the minitest autorun and pride gems, a unit testing framwork. It provides assertions to make your tests clean and readable.
require 'minitest/autorun'
require 'minitest/pride'

## This require lets this test file know about the bank file in the lib directory, so we can test the Bank class
require './lib/bank'

# This require lets this test file know about the credit_card file in the lib directory, so we have access to the CreditCard class
require './lib/credit_card'

# This require lets this test file know about the credit_check file in the lib directory, so we have access to the CreditCheck class
require './lib/credit_check'

# all our tests for a class live in a test class. It inherits from the Minitest class (which we required on line 2)
class BankTest < Minitest::Test

  # The setup method is called before every test method runs. It can be used to set up fixture information. In this case, it creates an instance of bank that passes one argument, the name of the bank that is a String

  # The test method must start with "test_" to run, and test name should describe the expected functionality
  def test_it_exists

    # Creates an instance of bank so we can test it
    # It passes one argument, a bank name that is a String
    bank = Bank.new("Wells Fargo")

    # Assert it is an instance of the Bank class
    # On the left of the comma is the Expected value, and the right of the comma is the Actual value
    assert_instance_of Bank, bank
  end

  def test_it_has_a_name

    # Creates an instance of bank so we can test it
    # It passes one argument, a bank name that is a String
    bank = Bank.new("Wells Fargo")

    # Assert that the String that was passed in as an argument is the same as the return value when we call .name
    # The instance variable is stored with the argument
    # I wrote an attr_reader, which automatically sets up a getter for this instance variable
    assert_equal "Wells Fargo", bank.name
  end

  def test_it_knows_a_transaction_is_invalid_when_credit_card_is_invalid

    # Creates an instance of bank so we can test it
    # It passes one argument, a bank name that is a String
    bank = Bank.new("Wells Fargo")

    # It creates an instance of credit_card so we can test it.
    # It passes two arguments, a card number that is a String and a card limit that is an Integer.
    credit_card = CreditCard.new("4024007106512380", 15000)

    # This method asserts that a boolean with a false value will be returned when I call the method .valid_transaction? on an invalid credit card

    # The method passes two arguments, an amount with the value of 100 (Integer) and a credit card

    # In Ruby, a boolean refers to a value of either true or false , both of which are defined as their very own data types. Every appearance, or instance, of true in a Ruby program is an instance of TrueClass, while every appearance of false is an instance of FalseClass
    assert_equal false, bank.valid_transaction?(100, credit_card)
  end

  def test_it_knows_a_transactions_is_invalid_when_the_amount_is_over_the_limit

    # Creates an instance of bank so we can test it
    # It passes one argument, a bank name that is a String
    bank = Bank.new("Wells Fargo")

    # It creates an instance of credit_card so we can test it.
    # It passes two arguments, a card number that is a String and a card limit that is an Integer.
    credit_card = CreditCard.new("5541808923795240", 15000)

    # This method asserts that a boolean with a false value will be returned when I call the method .valid_transaction? when the amount is over the credit card's limit

    # The method passes two arguments, an amount with the value of 20000 (Integer) and a credit card
    assert_equal false, bank.valid_transaction?(20000, credit_card)
  end

  def test_it_knows_when_a_transaction_is_valid

    # Creates an instance of bank so we can test it
    # It passes one argument, a bank name that is a String
    bank = Bank.new("Wells Fargo")

    # It creates an instance of credit_card so we can test it.
    # It passes two arguments, a card number that is a String and a card limit that is an Integer.
    credit_card = CreditCard.new("5541808923795240", 15000)

    # This method asserts that a boolean with a true value will be returned when I call the method .valid_transaction? when it is a valid credit card and the amount is within credit card's limit

    # The method passes two arguments, an amount with the value of 11000 (Integer) and a credit card
    assert_equal true, bank.valid_transaction?(11000, credit_card)
  end

end
