class CheckoutController < ApplicationController
  def create
    @record = Record.find(params[:id])
    if @record.nil?
      redirect_to root_path
      nil
    end

    respond_to do |format|
      format.js
    end
  end
end
