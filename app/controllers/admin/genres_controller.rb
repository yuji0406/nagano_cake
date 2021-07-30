class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre,only:[:edit,:update]
  def index
    @genres=Genre.all
    @genre=Genre.new
  end

  def edit
  end

  def create
    @genre=Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def update
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
  
  def set_genre
    @genre=Genre.find(params[:id])
  end

end
