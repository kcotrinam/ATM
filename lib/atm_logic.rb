class Atm
  attr_accessor :savings

  def initialize
    @savings = 1000
  end

  def display
    @savings
  end

  def deposit(amount)
    amount = amount.to_i
    @savings += amount
  end

  def valid_deposit?(amount)
    amount = amount.to_i
    amount.positive? ? true : false
  end

  def withdraw(amount)
    amount = amount.to_i
    @savings -= amount
  end

  def valid_withdraw?(amount)
    amount = amount.to_i
    if amount.positive? && amount < @savings
      true
    else
      false
    end
  end

  def valid_money?(money)
    float?(money) || mixed?(money) ? false : true
  end

  def float?(cash)
    cash_split = []
    cash.length.times do |i|
      cash_split.push(cash[i])
    end
    cash_split.any?('.') ? true : false
  end

  def mixed?(cash)
    arr = []
    cash.length.times do |i|
      arr.push(cash[i])
    end
    arr.any?('a'..'z') ? true : false
  end
end
