class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    # @transfer = transfer
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    # @transfer_amount = 50
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  # def execute_transaction
  #   if (sender.valid?)
  #     @status = 'rejected'
  #     return "Transaction rejected. Please check your account balance."
  #   else valid? && sender.balance > @transfer_amount
  #     sender.balance -= @transfer_amount
  #     receiver.balance += @transfer_amount
  #     @status = 'complete'
  #     @transfer_amount = 0
  #   end
  # end




  def execute_transaction
    if valid? && sender.balance > @amount && @status == 'pending'
      sender.balance -= @amount
      receiver.balance += @amount
      @status = 'complete'
      # @transfer_amount = 0
    else
      reject_transfer
    end
  end

  def reject_transfer
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.execute_transaction
      sender.balance += @amount
      receiver.balance -= @amount
      @status = 'reversed'
    end
  end


end
