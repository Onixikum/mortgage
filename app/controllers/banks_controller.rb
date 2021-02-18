class BanksController < ApplicationController

  def index
    @banks = Bank.all
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(user_params)
    if @bank.save
      flash[:success] = "Bank create!"
      redirect_to root_path
    else
      render 'new'
    end
  end

private

  def user_params
    params.require(:bank).permit(:bank_name, :interest_rate, :maximum_loan,
                                 :minimum_down_payment, :loan_term)
  end


end
