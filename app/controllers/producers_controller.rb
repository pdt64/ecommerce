class ProducersController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @producers = Producer.order(created_at: :desc).page(params[:page])
    add_breadcrumb "Producers", :producers_index_path
  end

  def show
    @producer = Producer.find(params[:id])
    add_breadcrumb "Producers", :producers_index_path
    add_breadcrumb @producer.producer_name, :producers_show_path
  end
end
