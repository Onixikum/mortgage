class CalculationsController < ApplicationController

  def show
    @calculation = Calculation.find(params[:id])
    @bank = @calculation.bank

    @ammaunt_borrowed = @calculation.initial_loan
    @annual_interest_rate = @bank.interest_rate


    monthly_rate = (@bank.interest_rate/12).round(2)

    @equity = @calculation.initial_loan + @calculation.down_payment

    @monthly_payment = []
    interest_payment = @equity * @annual_interest_rate * 0.01 / 12

    n = @bank.loan_term
    i = 1
    while i <= @bank.loan_term do

      monthly_payment = @ammaunt_borrowed * monthly_rate * (1 + monthly_rate)**n / ((1 + monthly_rate)**n - 1)


      @monthly_payment << [ monthly_payment.to_f.round(2), interest_payment.to_f.round(2) ]
      interest_payment = (@equity - monthly_payment) * @annual_interest_rate * 0.01 / 12
      n -= 1
      i += 1
    end

    @total_payment = (@monthly_payment[-1][0] * (1 + @bank.interest_rate / 100))/@bank.loan_term
  end

  def new
    @banks = Bank.all
    @calculation = Calculation.new
  end

  def create
    @calculation = Calculation.new(calculation_params)
    if @calculation.save
      flash[:success] = "Calculation create!"
      redirect_to calculation_path(id: @calculation.id)
    else
      render 'new'
    end
  end

private

  def calculation_params
    params.require(:calculation).permit(:initial_loan, :down_payment, :bank_id)
  end
end
