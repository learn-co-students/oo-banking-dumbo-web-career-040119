require 'pry'
require_relative 'transfer'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    @deposit_balance
  end

  def deposit(money)
    @balance += money
  end

  # def display_balance
  #   "Your balance is $#{self.balance}."
  # end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == 'open' && @balance > 0
  end

  def close_account
    @status = 'closed'
  end

end
