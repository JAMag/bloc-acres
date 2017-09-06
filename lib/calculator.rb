class Calculator < ActiveRecord::Base




  def self.sum(a, b)
    a.to_i + b.to_i
  end

  def self.subtr(a, b)
    a.to_i - b.to_i
  end

  def self.total_per_month(yearly_salary, monthly_debt)
    ((yearly_salary.to_i / 12) / 3) - (monthly_debt.to_i)
  end



end