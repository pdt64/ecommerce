class WritersController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @writers = Writer.order(created_at: :desc).page(params[:page])
    add_breadcrumb "Writers", :writers_index_path
  end

  def show
    @writer = Writer.find(params[:id])
    add_breadcrumb "Writers", :writers_index_path
    add_breadcrumb @writer.writer_name, :writers_show_path
  end
end
