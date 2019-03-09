# Declare Bank class
class Bank

  # The attr_reader create a method called name, which returns the value in the @name instance variable
  attr_reader :name

    # The initialize method is called when an object is created calling .new on the class. Because one argument (name) is listed in the parenthesis, any time we call .new on the class, it will expect one argument
  def initialize(name)

    # Creates an instance variable called @name, which holds the value that was passing in as the name argument
    @name = name
  end

  # This method passes two arguments - the first is an amount (Integer) and the second is a credit_card (Object)
  # The ? at the end of valid_transaction signifies that this returns a boolean (true of false value), so we can setup a conditional statement to evaluate it
  def valid_transaction?(amount, credit_card)

    # This is the beginning of the conditional statement.
      # In BankTest, we required the credit_card file and credit_check file), so we have access to the methods in those classes.
      #  .limit is an instance variable/method in the CreditCard class that we can call upon
    # If the card limit is greater than or equal to the amount charged AND the card is valid, then it will return true. Otherwise, it will return false.
      # Make sure to include the correct number of 'end' - one 'end' is used to close the conditional statement, and the second is used to close the .valid_transaction? method
    if credit_card.limit >= amount && credit_card.is_valid?
      true
    else
      false
    end
  end
end
