class Oystercard
  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up (money)
    fail 'You have exceeded card limit' if exceed_maximum?(money)
    @balance += money
  end

  def deduct (amount)
    @balance -= amount
  end

  def touch_in
    fail 'insufficient fund' if fund_sufficient?
    @usage = true
  end

  def touch_out
    @usage = false
  end

  def in_journey?
    false
    if @usage == true
      true
    else
      false
    end
  end

  private

  def exceed_maximum?(money)
    @balance + money > MAXIMUM_BALANCE
  end

  def fund_sufficient?
    @balance < MINIMUM_BALANCE
  end

end
