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
    @check_acct=current_user.accounts.where(:name=>'Cash').first
    @day=params[:date]
  end
end