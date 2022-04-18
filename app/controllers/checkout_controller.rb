class CheckoutController < ApplicationController
  def create
    record = Record.find(params[:id])
    if record.nil?
      redirect_to root_path
      return
    end

    respond_to do |format|
      format.js
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_create_url,
      cancel_url:           checkout_cancel_url,
      line_item:            [
        name:        record.name,
        description: record.description,
        amount:      (record.price * 100).to_i,
        currency:    "cad",
        quantity:    1
      ]
    )
  end

  def success; end

  def cancel; end
end
