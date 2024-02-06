require 'minitest/autorun'
require_relative './credit_check.rb'  
class CreditCheckTest < Minitest::Test
  def setup
    @credit_check = CreditCheck.new("5541808923795240", 15000)
  end

  def test_last_four
      assert_equal "5240", @credit_check.last_four
  end

  def test_limit
    assert_equal 15000, @credit_check.limit
  end

  def test_validity
    assert_equal true, @credit_check.is_valid?
  end


end