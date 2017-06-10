class Calculator < ActiveRecord::Base
  def self.sum(a, b)
    a.to_i + b.to_i
  end

  def self.subtr(a, b)
    a.to_i - b.to_i
  end
end