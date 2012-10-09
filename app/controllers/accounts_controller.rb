class AccountsController < ApplicationController
  def create
    @user=current_user
    @shared_users=@user.accounts.where(:name=>params[:account][:name]).first.users
    @sumTransactions=0
    @shared_users.each do |user|
      @sumTransactions += user.transactions.where("transaction_date >= ?", Date.today).sum(:value).to_i
    end
    params[:account][:balance]=params[:account][:balance].to_i+@sumTransactions
    @account = Account.create(params[:account])
    @shared_users.each do |user|
      user.accounts<<@account
    end  
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
end