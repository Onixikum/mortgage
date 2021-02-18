class BanksController < ApplicationController

  def index
    @banks = Bank.all
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      flash[:success] = "Bank create!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    correct_bank
  end

  def update
    correct_bank
    if @bank.update(bank_params)
      flash[:success] = "Bank updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    correct_bank
    @bank.destroy
    flash[:success] = "Bank deleted"
    redirect_to root_path
  end

private

  def bank_params
    params.require(:bank).permit(:bank_name, :interest_rate, :maximum_loan,
                                 :minimum_down_payment, :loan_term)
  end

  def correct_bank
    @bank = Bank.find(params[:id])
  end
end
