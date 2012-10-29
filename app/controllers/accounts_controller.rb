class AccountsController < ApplicationController
before_filter :signed_in_user, only: [:create, :destroy]
  def create
    @user=current_user
    @account = Account.new(:name=>params[:account][:name], :balance=>params[:account][:balance], :initial_balance=>params[:account][:balance], :owner=>@user.id)
    if @user.priorities.first
      newRank = @user.priorities.first.rank += 1
    else
      newRank = 1
    end
    @user.priorities << Priority.new(:account=>@account, :rank=>newRank)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end
  
  def index
    @user=current_user
    @accounts=@user.accounts.where("name != ?", "Cash").paginate(page: params[:page])
    @checkAcct=@user.accounts.where(:name=>"Cash").first
  end
  
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_path}
      format.js
    end
  end
  
  def update
    @account = Account.find(params[:id])
    @user = User.find(params[:user_id])
    if @account.registered?(@user.id)
      @user.accounts.delete(@account)
    else
      @user.accounts << @account
    end
    respond_to do |format|
      format.html { redirect_to accounts_path}
      format.js
    end
  end
end