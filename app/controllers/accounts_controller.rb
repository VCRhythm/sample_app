class AccountsController < ApplicationController
  def create
    @user=current_user
    @account = Account.create(params[:account])
    @pastAccount = @user.accounts.where(:name=>params[:account][:name]).first
    if @pastAccount
      if @account.name=="Cash" 
        @shared_users=@pastAccount.users.includes(:transactions).where("transaction_date >=?", Date.today)
        @sumTransactions=0
        @shared_users.each do |user|
          @sumTransactions += user.transactions.where("transaction_date >= ?", Date.today).sum(:value).to_i
        end
        @account.balance+=@sumTransactions
      else
        @shared_users=@pastAccount.users
      end
      @shared_users.each do |user|
        user.accounts<<@account
      end  
    else
      @user.accounts<<@account
    end
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  def index
    @accounts=current_user.accounts.paginate(page: params[:page])
  end
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_path}
      format.js
    end
  end
end