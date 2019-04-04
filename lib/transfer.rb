require 'pry'
require_relative 'bank_account'

class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    #sender = BankAccount.name
    @receiver = receiver
    #receiver = BankAccount.name
    @amount = amount #this can be self.amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def transaction
    self.sender.balance -= amount
    self.receiver.balance += amount
  end

  def bad_transfer
    self.status = "rejected"
  end

  def execute_transaction
      if self.status == "pending" && self.status != "rejected" && self.sender.balance >= self.amount
        self.transaction
        self.status = "complete"
      else
        self.bad_transfer
        return "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if self.status == "complete"
    self.sender.balance += amount
    self.receiver.balance -= amount
    self.status = "reversed"
    end
  end

end
