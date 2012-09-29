class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user=current_user
      @micropost = @user.microposts.build
      @transaction = Transaction.new
      @transactions = @user.transactions
      #@sum_transactions = @transactions.sum(:value).to_f
      if params[:date]
        @day=Date.parse(params[:date])
      elsif @transactions.any?
        @day=@transactions.first.transaction_date+1
        if @day == Date.current+1
          @day-=1 
        end
      else
        @day=Date.current
      end
      @accounts=@user.accounts
      @debt_acct = @accounts.where(:name=>'Targeted Debt').first
      @check_acct = @accounts.where(:name=>'Cash').first
      @flows = @user.flows
      @check_date = @check_acct.created_at.to_date
      @flow_sum=Hash.new
      @flows.each do |flow|
        @flow_sum[flow.id] = @transactions.where("transaction_date >= ? AND flow_id=?", @check_date, flow.id).sum(:value)
      end
      @spending_sum = @flow_sum.values.inject{|sum, x| sum+x}
      #@feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
   
  end
 
end
