# It opens a Pry session at the point it's called and makes all program state at that point available. The Pry session will then begin within the scope of the object (or binding).
require 'pry'

# Declare CreditCard class
class CreditCard

  # The attr_reader creates two methods - one called card_number, which returns the value in the @card_number instance variable, and the second called limit, which returns the value in the @limit instance variable
  attr_reader :card_number,
              :limit

  # The initialize method is called when an object is created calling .new on the class. Because two arguments (card_number and limit) are listed in the parenthesis, any time we call .new on the class, it will expect two arguments
  def initialize(card_number, limit)

    # Creates instance variables called @card_number and @limit, which holds the value that was passing in as the card_number and limit argument
    @card_number = card_number
    @limit = limit
  end

  def last_four

    # Creates method that returns the last four digits of the card_number
    # Since the card_number is a String, we can reference the the desired return values by its index
    # The [-4..1] is passing a range. Its beginning and end are interpreted as offsets delimiting the substring to be returned
    @card_number[-4..-1]
  end

  def is_valid?

    # Creates an instance of credit_check (or credit_check object) that passes one argument, a card number that is a String
    credit_check = CreditCheck.new(card_number)

    # Creates a conditional statement that is using the .divisible_by_10? method from the CreditCheck class. If the crecit_check is equal to true, it will return true, otherwise it will return false.
      # In CreditCardTest, we required the credit_check file, so we have access to the methods in the CreditCheck class
    # The .divisible_by_10? method was created using the helper methods are make up the formula used to verify that a card_number is valid
    if credit_check.divisible_by_10? == true
      return true
    else
      return false
    end
  end

end
