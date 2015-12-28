class AuthorsController < ApplicationController
  def index

  end

  def show
    #require 'pry'; binding.pry
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.save
    flash[:success] = "Author has been created"
    redirect_to @author
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

end
