class Transfer
  attr_accessor :sender, :receiver, :amount, :status #macro setter

  def initialize(sender, receiver, amount) #set the value of where to start
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? #uses bank_account to check if sender and receiver is valid
  end

  def execute_transaction
    if self.valid? && sender.balance > self.amount && sender.status = "pending"
      #if account is valid and current balance is greater than the amount being sent and status is "pending"
    sender.balance -= self.amount
    #subtracts amount being sent from senders balance
    receiver.balance += self.amount
    #adds amount being sent from person receiving balance
    self.status = "complete" # changes status to "complete" if conditional is true
    else
      self.status = "rejected" # changes status from "pending" to "rejected"
    return "Transaction rejected. Please check your account balance."
    #returns this string
    end
  end

  def reverse_transfer
    if self.status == "complete"
      #if class(Transfer) status is same as string
      sender.balance += self.amount
      #add amount to senders balance
      receiver.balance -= self.amount
      #subtracts amount to receivers balance
      self.status = "reversed"
      #status changes to string "reversed"
    end
  end
end
