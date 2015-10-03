class LoanRepayments
  attr_accessor :principal, :intRate, :term
  
  def initialize(principal, intRate, term)
    @principal = principal
    @intRate = intRate/100
    @term = term
  end
  
  def calcPmts()
        pmts = (@intRate/12)*@principal/(1-(1+(@intRate/12))**(-@term))
    return (pmts).round(2)
  end
end

#puts "Please enter the Principal"
#princ = (Float(gets())).round(2)
#puts "Please enter the interest rate"
#int = (Float(gets())).round(2)
#puts "Please enter the term"
#trm = Integer(gets())

#LP = LoanRepayments.new(princ, int, trm)

#puts "Your repayments for #{princ}, at #{int}% over #{trm} years are #{LP.calcPmts}."
