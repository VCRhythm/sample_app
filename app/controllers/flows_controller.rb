class FlowsController < ApplicationController
  
  def new
  end
  
  def create
    @flow=Flow.create(params[:flow])
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  
  def destroy
    @flow = Flow.find(params[:id])
    @flow.destroy
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  
  def show
    @user=current_user
    @check_acct=@user.accounts.where(:name=>"Cash").first
    @flow=Flow.find(params[:id])
    @transactions=@check_acct.transactions.where("flow_id=? AND value>?", @flow.id,0).order(:transaction_date).reverse_order
    @sum_transactions = @transactions.sum(:value)
    @transactionMonth = @transactions.group_by{|t| t.transaction_date.beginning_of_month.strftime('%B')}
    @transactionUTC={}
    @transactions.each do |transaction|
        @transactionUTC[transaction.id] = Time.parse(transaction.transaction_date.to_s).utc.to_i*1000
    end
  end
end