require "date"

class RecordsController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @records = Record.order(created_at: :desc).page(params[:page])
    add_breadcrumb "Records", :records_index_path
  end

  def show
    @record = Record.find(params[:id])
    add_breadcrumb "Records", :records_index_path
    add_breadcrumb @record.name, :records_show_path
  end

  def filter_sale
    @records = Record.where("sale = ?", true).page(params[:page])
    add_breadcrumb "Sale Records", :records_filter_sale_path
  end

  def filter_new
    now = Time.zone.today
    three_days_ago = (now - 3)
    @records = Record.where("created_at > ?", three_days_ago).page(params[:page])
    add_breadcrumb "New Records", :records_filter_new_path
  end
end
