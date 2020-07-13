require_relative 'bank_account'
class Transfer

	attr_accessor :sender, :receiver, :amount, :status, :counter

	def initialize(sender,receiver,amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = 'pending'
		@counter = 1
	end

	def valid?
		sender.valid? && receiver.valid?
	end

	def execute_transaction
		if @counter < 1
			"you can only do one transaction"
		else
			if sender.valid? && sender.balance > amount
			        receiver.balance += amount
        			sender.balance -= amount
        			self.status = 'complete'
				@counter -= 1

			else
				self.status = 'rejected'
        			"Transaction rejected. Please check your account balance."
			end
		end
	end

	def reverse_transfer
		if self.status == 'complete'
			receiver.balance -= amount
			sender.balance += amount
			self.status = 'reversed'
		end
	end
end
