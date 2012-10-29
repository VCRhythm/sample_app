class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user=current_user
      @micropost = @user.microposts.build
      #@sum_transactions = @transactions.sum(:value).to_f
      @accounts=@user.accounts
      if @user.accounts.where(:name=>"Cash")
        @check_acct = @accounts.where(:name=>'Cash').first
        @check_date = @check_acct.created_at.to_date
        @flows = Flow.all
        @transaction = Transaction.new
        @transactions = @user.transactions.where("transaction_date<=?", Date.today)
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
          @flow_sum[flow.id] = @check_acct.transactions.where("transaction_date >= ? AND transaction_date <= ? AND flow_id=?", @check_date, Date.current, flow.id).sum(:value)
        end
        @adjustment_sum=@check_acct.adjustments.sum(:value)*month_difference(Date.today, @check_date)
        @check_acct.balance += @flow_sum[54]
        @flow_sum.delete(54)
        @spending_sum = @flow_sum.values.inject{|sum, x| sum+x}-@adjustment_sum
        @cash = (@check_acct.balance-@spending_sum).round
        if @cash <0
          @total=@spending_sum
        else
          @total=@check_acct.balance
        end
        if cashTransaction=@transactions.where('flow_id=? AND transaction_date=?', 54, @day).first
          @cashValue=cashTransaction.value.round
        else
          @cashValue=0
        end
        @cash_bar="bar-success"
        #@feed_items = current_user.feed.paginate(page: params[:page])
      end
    end
  end
   
  def help
   
  end

  def month_difference(a, b)
    difference = 12 * (b.year - a.year).abs + (b.month - a.month).abs
    if b.day==1 
      difference+=1
    end
    return difference
  end
  
end
