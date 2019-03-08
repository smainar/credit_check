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

end
