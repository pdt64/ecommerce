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

  def search
    if params[:search].blank?
      redirect_to records_index_path and return
    else
      @parameter = params[:search].downcase
      @genre = params[:genre]
      @results = if params[:genre].blank?
                   Record.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
                 else
                   Record.all.where("lower(name) LIKE :search AND genre_id = :genre",
                                    search: "%#{@parameter}%", genre: @genre)
                 end
    end
  end
end
