class PhrasesController < ApplicationController
  def create 
    @song = Song.find(params[:song_id])
    @phrase = @song.phrases.create(phrase_params)

    turbo_stream
    # redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:song_id])
    @phrase = @song.phrases.find(params[:id])
  end

  def update
    @song = Song.find(params[:song_id])
    @phrase = @song.phrases.find(params[:id])
    if @phrase.update(phrase_params)
      redirect_to @song
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @song = Song.find(params[:song_id])
    @phrase = @song.phrases.find(params[:id])

    @phrase.destroy
    redirect_to song_path(@song), status: 303
  end

  private
    def phrase_params
      params.require(:phrase).permit(:sentence, :translation, :level)
    end
end
