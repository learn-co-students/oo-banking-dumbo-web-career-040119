class BankAccount
  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name,balance=1000,status='open')
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if self.balance > 0 && self.status == 'open'
      true
    else
       false
    end
  end

  def close_account
    self.status = 'closed'
  end
end
