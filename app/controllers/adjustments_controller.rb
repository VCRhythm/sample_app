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
    @adjustments=current_user.adjustments.paginate(page: params[:page])
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
end