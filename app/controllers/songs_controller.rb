class SongsController < ApplicationController
  def index
    @songs = current_user.songs
    @phrases = current_user.phrases
  end

  def show
    @song = current_user.songs.find(params[:id])
 
    rescue ActiveRecord::RecordNotFound
      redirect_to(root_url, :notice => 'Record not found')
  end

  def new
    @song = current_user.songs.new
  end

  def create 
    @song = current_user.songs.new(song_params)

    if @song.save 
      redirect_to @song
    else 
      render :new, status: 422
    end
  end

  def edit
    @song = current_user.songs.find(params[:id])
  end

  def update
    @song = current_user.songs.find(params[:id])
    
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @song = current_user.songs.find(params[:id])
    @song.destroy

    redirect_to root_path, status: :see_other
  end

  private 
    def song_params
      params.require(:song).permit(:title, :lyrics, :song_link, :artist_name, :user_id)
    end
end
