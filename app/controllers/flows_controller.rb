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
    @flow=Flow.find(params[:id])
    @transactions=@user.transactions.where(flow_id: @flow.id).paginate(page: params[:page])
  end
end