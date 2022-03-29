class RecordsController < ApplicationController
  def index
    @records = Record.order(created_at: :desc).page(params[:page])
  end

  def show
    @record = Record.find(params[:id])
  end
end
