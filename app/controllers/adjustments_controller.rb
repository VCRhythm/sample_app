class AdjustmentsController < ApplicationController
before_filter :signed_in_user, only: [:create, :destroy]
  def create
    @user=current_user
    @adjustment = @user.adjustments.create(params[:adjustment])
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  def index
    @user=current_user
    @adjustments=@user.adjustments.paginate(page: params[:page])
  end
  def destroy
    @user=current_user
    @adjustment = @user.adjustments.find(params[:id])
    @adjustment.destroy
    respond_to do |format|
      format.html { redirect_to adjustments_path}
      format.js
    end
  end
  def show
    @adjustment = Adjustment.find(params[:id])
  end
  def implement
    @user=current_user
    @adjustments=@user.adjustments
    transactions=[]
    @adjustments.each do |adjustment|
      12.times do |i|
        transactions << Transaction.new(:user_id=>@user.id, :value=>adjustment.value, :transaction_date=>Date.today.months_since(i).at_beginning_of_month, :flow_id=>999)
      end
    end
    Transaction.import transactions
    respond_to do |format|
      format.html { redirect_to adjustments_path}
      format.js
    end
  end
end