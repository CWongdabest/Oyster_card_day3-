class Oystercard
  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up (money)
    fail 'You have exceeded card limit' if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def deduct (amount)
    @amount = amount
    @balance -= @amount
  end

end
