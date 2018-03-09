class CalculatorsController < ApplicationController



  def index
  end

  def new
    @result = total_per_month(params[:yearly_salary], params[:monthly_debt])
    render :index
    current_user.update_attribute(:prop_afford, @result.to_i)
  end



  private
  def total_per_month(yearly_salary, monthly_debt)
    ((yearly_salary.to_i / 12) / 3) - (monthly_debt.to_i)
  end


end