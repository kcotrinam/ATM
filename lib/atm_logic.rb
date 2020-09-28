class Atm
  attr_accessor :savings

  def initialize
    @savings = 1000
  end

  def display
    @savings
  end

  def deposit(amount)
    if amount.positive?
      @savings += amount
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

atm = Atm.new
puts 'enter an amount'
money = gets.chomp

p atm.valid_money?(money)
