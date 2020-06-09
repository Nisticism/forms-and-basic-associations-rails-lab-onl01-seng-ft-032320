class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    x = Note.create(content: params[:song_notes_attributes_0_content])
    @song.notes << x
    y = Note.create(content: params[:song_notes_attributes_1_content])
    @song.notes << y
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:artist_name, :title, :genre_id, :song_notes_attributes_0_content, :song_notes_attributes_1_content, :song_notes_attributes_2_content)
  end
  
end

