class FlowsController < ApplicationController
  def new
  end
  def create
    @flow = current_user.flows.build(params[:flow])
    @flow.save 
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
end