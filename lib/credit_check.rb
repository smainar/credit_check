# It opens a Pry session at the point it's called and makes all program state at that point available. The Pry session will then begin within the scope of the object (or binding).
require 'pry'

# Declare CreditCheck class
class CreditCheck

  # The attr_accessor creates a getter and setter method called card_number. The getter method returns the value in the @card_number instance variable. The setter method establishes or reestablishes the value for instance variable:
    # def card_number=(c)
      # @card_number = c
    # end
  attr_accessor :card_number

  # The initialize method is called when an object is created calling .new on the class. Because one argument (card_number) is listed in the parenthesis, any time we call .new on the class, it will expect one argument
  def initialize(card_number)

    # Creates an instance variable called @card_number, which holds the value that was passing in as the card_number argument
    @card_number = card_number
  end

  def single_digits

    # This method uses the @card_number instance variable to interate over each number/digit so that they are separated individually into an array (in String form) when calling the .single_digits method
    # The last step is the new array converts the Strings into Integers
    @card_number.chars.map do |single_digit|
      single_digit.to_i
    end
  end

  def every_other_digit_is_doubled

    # Creates an empty array and stores it in the variable called doubled_digits_array
    doubled_digits_array = []

    # Uses the single_digits method created above to iterate over the array using the each_with_inder Enumerator.
    # The block element contains the value (which is a digit) and the index (the position of the value - in an array each value/element is indexed)
    single_digits.each_with_index do |digit, index|

      # Beginning of conditional statement
      # If the position of the value/digit is even (i.e. indexed at 0, 2, 4, etc.)
      if index.even?

        # than you multiple that value/digit by 2 and shovel it into the doubled_digits_array
        doubled_digits_array << digit * 2

      # If the position of the value/digit is even (i.e. indexed at 0, 2, 4, etc.)
      else
        # than you take the value/digit (which is unchanged) and shovel it into the doubled_digits_array
        doubled_digits_array << digit
      end
    end

    # Since we used an #each Enumerator (which returns the original value), and we want the array with the new values returned, we need to explictly call it at the end of the method
    return doubled_digits_array
  end

  def double_digits_are_summed

    # Creates an empty array and stores it in the variable called doubled_digits_summed_array
    doubled_digits_summed_array = []

    # Uses the every_other_digit_is_doubled method created above to iterate over the array using the #each Enumerator.
    # The block element contains the value (which is a digit)
    every_other_digit_is_doubled.each do |digit|

      # Beginning of conditional statement
      # If the value/digit is greater than 9
      if digit > 9

        # than you subtract that value/digit by 9 and shovel it into the doubled_digits_summed_array
        doubled_digits_summed_array << digit - 9

        # If the value/digit is less than 9
      else

        # # than you take the value/digit (which is unchanged) and shovel it into the doubled_digits_summed_array
        doubled_digits_summed_array << digit
      end
    end

    # Since we used an #each Enumerator (which returns the original value), and we want the array with the new values returned, we need to explictly call it at the end of the method
    return doubled_digits_summed_array
  end

  def results_summed

    # Uses the double_digits_are_summed method created above and calls the #sum Enumerable to take the sum of all the digits
    double_digits_are_summed.sum
  end

  def divisible_by_10?

    # Uses the results_summed method created above and uses modulo operator (%) to check if the results_summed is divisible by 10
    results_summed % 10 == 0
  end

  def check_validation

    # Since the summed results modulo 10 is zero, the account number is valid according to the algorithm.
    # Therefore, I use the divisible_by_10? method to create a conditional statement
    if divisible_by_10? == true

      # If it evaluates to true than the following message is returned
        # @card_number instance variable is calling the string interpolation method so we don't hard code the valid card number
      return "The number #{@card_number} is valid!"
    else

      # If it evaluates to false than the following message is returned
        # @card_number instance variable is calling the string interpolation method so we don't hard code the invalid card number
      return "The number #{@card_number} is invalid!"
    end
  end

end
