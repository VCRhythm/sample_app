class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user=current_user
      @micropost = @user.microposts.build
      #@sum_transactions = @transactions.sum(:value).to_f
      @accounts=@user.accounts
      #@debt_acct = @accounts.where(:name=>'Targeted Debt').first
      #@debtInitialBalance = @accounts.where(:name=>'Targeted Debt').last.balance
      @check_acct = @accounts.where(:name=>'Cash').first
      @shared_users = Account.where(:id=>@check_acct.id).first.users
      @check_date = @check_acct.created_at.to_date
      @flows = Flow.includes(:transactions)
      @transaction = Transaction.new
      @transactions = @user.transactions
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
      @flow_sum=Hash.new
      @flows.each do |flow|
        @flow_sum[flow.id]=0
        @shared_users.each do |user|
          @flow_sum[flow.id] += user.transactions.where("transaction_date >= ? AND transaction_date <= ? AND flow_id=?", @check_date, Date.current, flow.id).sum(:value)
        end
      end
      @check_acct.balance += @flow_sum[54]
      @flow_sum.delete(54)
      @spending_sum = @flow_sum.values.inject{|sum, x| sum+x}
      @cash = (@check_acct.balance-@spending_sum).round
      #@feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
   
  def help
   
  end
 
end
