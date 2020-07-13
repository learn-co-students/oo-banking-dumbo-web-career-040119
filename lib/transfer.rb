require_relative 'bank_account'
require 'pry'
class Transfer

attr_reader :sender, :receiver, :status, :amount

def initialize(sender, receiver, amount)
@sender = sender
@receiver = receiver
@status = "pending"
@amount = amount
@amount_history = amount
end

def valid?
  sender.valid? and receiver.valid? ? true:false
end

def execute_transaction

  if sender.balance < amount
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
    else
    sender.balance -= amount
    receiver.balance +=amount
    @status = "complete"
    @amount -= amount
end


end

def reverse_transfer
  if @status == "complete"
      sender.balance += @amount_history
      receiver.balance -=@amount_history
@status = "reversed"
end 

end


  end
