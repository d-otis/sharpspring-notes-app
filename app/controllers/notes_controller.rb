class NotesController < ApplicationController
  before_action :set_note, except: [:index, :new]
  before_action :require_login
  before_action :require_auth, except: [:new, :create, :index]

  def index
    @notes = Note.where(user: current_user).order(:pinned => :desc)
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

  def require_auth
    redirect_to user_path(current_user), message: "You do not own this note." unless @note.user == current_user
  end

end