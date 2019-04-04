require 'pry'
require_relative 'bank_account'

class Transfer
    attr_reader :sender, :receiver, :status, :amount
    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"

      #binding.pry
    end

    def valid?
      sender.valid? && receiver.valid?
      #self.sender.balance > amount && self.receiver.balance > amount
    end

    def execute_transaction
      while (@status == "pending")
        if valid? && sender.balance > amount
          sender.balance -= amount
          receiver.balance += amount
          @status = "complete"
        else
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        end
      end
    end

    def reverse_transfer
        if @status == "complete"
          sender.balance += amount
          receiver.balance -= amount
          @status = "reversed"
        end
     end
end

