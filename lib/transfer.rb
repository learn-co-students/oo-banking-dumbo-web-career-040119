class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def valid_balance
    @sender.balance >= @amount
  end

  def execute_transaction
    if @status == 'complete'
      return
    end

    if @sender.valid? == false || valid_balance == false
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end

    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = 'complete'
  end

  def reverse_transfer
    if status == 'complete'

      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end

end
