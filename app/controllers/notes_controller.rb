class NotesController < ApplicationController
  before_action :set_note, except: [:index, :new]

  def index
    if logged_in?
      @notes = Note.where(user: current_user).order(:pinned => :desc)
    else
      redirect_to "/login", message: "Please login or register to see your notes!"
    end
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to note_path(@note)
    else
      render :new, message: "There was an error."
    end
  end

  def edit
    
  end

  def update
    @note = Note.find_by(id: params[:id])

    if @note.update(note_params)
      flash[:message] = "Note successfully updated!"
      redirect_to note_path(@note)
    else
      render :edit, message: "There was an error updating your note."
    end
  end

  def destroy
    
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :pinned, :user_id)
  end

  def set_note
    @note = Note.find_by(id: params[:id])
  end

end