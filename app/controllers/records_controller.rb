require "date"

class RecordsController < ApplicationController
  def index
    @records = Record.order(created_at: :desc).page(params[:page])
  end

  def show
    @record = Record.find(params[:id])
  end

  def filter_sale
    @records = Record.where("sale = ?", true).page(params[:page])
  end

  def filter_new
    now = Time.zone.today
    three_days_ago = (now - 3)
    @records = Record.where("created_at > ?", three_days_ago).page(params[:page])
  end
end
