require_relative '../lib/atm_logic'
require_relative '../lib/user_login'

atm = Atm.new
user = User.new

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

def request_user_information(user)
  puts 'Enter your account Number'
  account_number = gets.chomp
  puts 'Enter your password'
  account_password = gets.chomp
  puts 'Verifying...'

  until user.valid_information?(account_number, account_password)
    puts 'Wrong! try again.'
    puts 'Enter your account Number'
    account_number = gets.chomp
    puts 'Enter your password'
    account_password = gets.chomp
    puts 'Verifying...'
  end
end

def deposit_validator(atm)
  puts 'How much do you want to deposit?'
  amount = gets.chomp
  until atm.valid_money?(amount) && atm.valid_deposit?(amount)
    puts "#{amount} is not a correct amount. Try again"
    amount = gets.chomp
  end
  atm.deposit(amount)
end

def withdraw_validator(atm)
  puts 'How much do you want to withdraw'
  amount = gets.chomp
  until atm.valid_money?(amount) && atm.valid_withdraw?(amount)
    puts "You don't have #{amount} saved. Try again"
    amount = gets.chomp
  end
  atm.withdraw(amount)
end

def atm_case(atm)
  user_option = atm_options
  case user_option
  when 1
    print "\033[2J\033[H"
    puts atm.display
  when 2
    print "\033[2J\033[H"
    deposit_validator(atm)
    puts "Your new savings is #{atm.display}"
  when 3
    print "\033[2J\033[H"
    withdraw_validator(atm)
    puts "Your new savings is #{atm.display}"
  else
    puts "I'm option #{user_option}"
  end
end

def run_atm(atm, user)
  request_user_information(user)
  print "\033[2J\033[H"
  puts 'Welcome...'
  sleep(2)
  atm_case(atm)
  continue?(atm, user)
end

def continue?(atm, user)
  puts 'do you want to continue (Y/N)'
  ans = gets.chomp.downcase
  if ans == 'y'
    print "\033[2J\033[H"
    run_atm(atm, user)
  else
    puts 'Thanks for using our service'
  end
end

run_atm(atm, user)
