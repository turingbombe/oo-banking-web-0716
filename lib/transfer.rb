require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
     if self.status != 'complete' 
      sender.balance -= self.amount
      receiver.balance += self.amount
      if self.valid? == true
        self.status = 'complete'
      else
        sender.balance += self.amount
        receiver.balance -= self.amount
        self.status = 'rejected'  
        "Transaction rejected. Please check your account balance."    
      end
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      sender.balance += self.amount
      receiver.balance -= self.amount
    end
    self.status = 'reversed'
  end

end
