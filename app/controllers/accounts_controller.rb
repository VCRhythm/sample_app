class FlowsController < ApplicationController
  def create
    @account = current_user.accounts.build(params[:account])
    @account.save
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
end