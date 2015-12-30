class PublishersController < ApplicationController
  
  before_action :set_publisher, except: [:index, :new, :create]

  def index

  end

  def show

  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      #require 'pry'; binding.pry;
      flash[:success] = "Publisher has been created"
      redirect_to @publisher
    else
      flash[:danger] = "Publishere has not been created"
      render :new
    end
  end

  def destroy
    if @publisher != nil && @publisher.destroy
      flash[:success] = "Publisher has been deleted"
      redirect_to publishers_path
    else
      flash[:danger] = "Publisher could not be found"
      redirect_to 
    end
  end

  private

  def set_publisher
     begin
       @publisher = Publisher.find(params[:id])
     rescue
       @publisher = nil
     end
  end

  def publisher_params
    params.require(:publisher).permit(:name)
  end

end

