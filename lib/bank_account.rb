class BankAccount
  attr_accessor :balance, :status #setter, can change
  attr_reader :name #getter, cannot change

  def initialize(name)
    @name = name
    @balance = 1_000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount #adds amount to instance(balance)
  end

  def display_balance
    "Your balance is $#{self.balance}." # calls instance(balance) inside class(BankAccount)
 end

  def valid?
    self.status == "open" && self.balance > 0 #valid when this statement is true
  end

  def close_account
    self.status = "closed" #changes instance (status) of "open" to "closed"
  end
end
