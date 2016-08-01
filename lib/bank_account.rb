require 'pry'
class BankAccount
  attr_accessor :bankaccount, :balance, :status
  attr_reader :name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(deposit_amt)
    self.balance += deposit_amt
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == 'open'
  end

  def close_account
    self.status = 'closed'
  end

end
