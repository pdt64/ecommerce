class CartController < ApplicationController
  def create
    id = params[:id].to_i
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      record = Record.find(id)
      redirect_to root_path
      flash[:notice] = "#{record.name} added to cart."
    end
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    record = Record.find(id)
    flash[:notice] = "- #{record.name} removed from cart."
    redirect_to root_path
  end
end
