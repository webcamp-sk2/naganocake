class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

 def index
   @genres = Genre.page(params[:page]).per(4)
   @genres = Genre.new
 end

 def create
   @genres = Genre.new(genre_params)
   @genre.save
   #後日追加↓
   redirect_to
 end

 def edit
   @genre = Genre.find(params[:id])
 end

 def update
     @genre = Genre.find(params[:id])
     @genre.update(genre_params)
     redirect_to admin_genres_path
 end

 private
 def genre_params
    params.require(:genre).permit(:name)
 end
end
