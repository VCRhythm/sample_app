class TransactionsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  
  def create
    @transaction=current_user.transactions.where(transaction_date: params[:transaction][:transaction_date], flow_id: params[:transaction][:flow_id]).first_or_initialize()
    @transaction.value=params[:transaction][:value]
    if @transaction.save
      flash.now[:success]="Added Transaction"
    else
      err = ''
      @transaction.errors.full_messages.each do |m|
        err << m << '. '
      end
      flash.now[:alert]="#{err}"
    end
    respond_to do |format|
      format.html {redirect_to transactions_path(current_user)}
      format.js
    end
  end
  
  def empty_day
    current_user.transactions.where(:transaction_date => params[:date]).delete_all
    current_user.transactions.create(:transaction_date => params[:date], :flow_id=>'0', :value=>'0')
    respond_to do |format|
      format.html {redirect_to transactions_path(current_user)}
      format.js {}
    end
  end
  
  def index
    @title = "Transactions"
    @user = current_user
    @transaction = Transaction.new
    @transactions = @user.transactions.paginate(page: params[:page])
    @sum_transactions = @transactions.sum(:value).to_f
    @flows = Flow.all
    render 'show_transactions'
  end

  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html {redirect_to transactions_user_path(current_user)}
      format.js
    end
  end
  
  def update
    @transaction=current_user.transactions.where(transaction_date: params[:date], flow_id: params[:id]).first_or_initialize()
    @transaction.description=params[:description]
    if @transaction.description==""
      @transaction.description=nil
    end
    @transaction.save
    respond_to do |format|
      format.html {redirect_to transactions_user_path(current_user)}
      format.js
    end
  end

  private
    def correct_user
      @transaction = current_user.transactions.find_by_id(params[:id])
      redirect_to root_url if @transaction.nil?
    end
end