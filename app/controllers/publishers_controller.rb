# frozen_string_literal: true

# PublishersController PublishersController
class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def show; end

  def new
    @page_title = 'Add New Publisher'
    @publisher = Publisher.new
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = 'Publisher Created'
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:id])
    @publisher.update(publisher_params)
    flash[:notice] = 'Publisher Updated'
    redirect_to publishers_path
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    flash[:notice] = 'Publisher Removed'
    redirect_to publishers_path
  end

private

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
