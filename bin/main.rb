require_relative '../lib/atm_logic'

def atm_options
  option = ''
  puts 'What do you want to do?'
  puts '1.- Consult savings'
  puts '2.- Deposit'
  puts '3.- Withdraw'
  option = gets.chomp.to_i
  while option < 1 || option > 3
    puts 'Wrong option. Choose again'
    puts '1.- Consult savings'
    puts '2.- Deposit'
    puts '3.- Withdraw'
    option = gets.chomp.to_i
  end
  option
end

atm = Atm.new

puts 'Enter your account Number'
account_number = gets.chomp
puts 'Enter your password'
account_password = gets.chomp
puts 'Verifying...'
sleep(2)
user_option = atm_options
case user_option
when 1
  puts atm.display
when 2
  puts 'How much do you want to deposit?'
  amount = gets.chomp
  until atm.valid_money?(amount) && atm.valid_deposit?(amount)
    puts "#{amount} is not a correct amount. Try again"
    amount = gets.chomp
  end
  atm.deposit(amount)
  puts "Your new savings is #{atm.display}"
when 3
  puts 'How much do you awnt to withdraw'
  amount = gets.chomp
  until atm.valid_money?(amount) && atm.valid_withdraw?(amount)
    puts "You don't have #{amount} saved. Try again"
    amount = gets.chomp
  end
  atm.withdraw(amount)
  puts "Your new savings is #{atm.display}"
else
  puts "I'm option #{user_option}"
end
