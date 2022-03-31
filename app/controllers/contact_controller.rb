class ContactController < ApplicationController
  def show
    @page = Page.find(2)
  end
end
