class CheckoutController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    record = Record.find(params[:id])
    if record.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_success_url,
      cancel_url:           checkout_cancel_url,
      line_items:           [
        name:        record.name,
        description: record.description,
        amount:      (record.price * 100).to_i,
        currency:    "cad",
        quantity:    1
      ]
    )

    redirect_to @session.url, allow_other_host: true
    # # respond_to do |format|
    #    format.js
    #  end
  end

  def success; end

  def cancel; end
end
