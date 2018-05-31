class PagesController < ApplicationController
  before_action :find_page, only: [:show, :edit, :update, :destroy]
  def index
    @page = Page.all.order("created_at DESC")
  end

  def show

  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to @page, notice: 'Successfully creating new page'
    end
  end

  def update
    if @page.update(page_params)
      redirect_to @page
    else
      render 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to root_path, notice: 'Successfully deleted page'
  end
  
  

  private

  def page_params
    params.require(:page).permit(:title, :description, :information)
  end

  def find_page
    @page = Page.find(params[:id])
  end
end
