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
      flash[:message] = @note.errors.full_messages
      redirect_to new_note_path
    end
  end

  def edit
  end

  def update
    @note = Note.find_by(id: params[:id])

    if @note.update(note_params)
      flash[:message] = ["Note successfully updated!"]
      redirect_to note_path(@note)
    else
      flash[:message] = @note.errors.full_messages
      redirect_to edit_note_path(@note)
    end
  end

  def toggle_pinned
    # WORKS
    @note.toggle!(:pinned)
    redirect_to "/dashboard"

    # figure out why eventListener doubles after every click
    # respond_to do |format|
    #   if @note.toggle!(:pinned)
    #     format.js
    #   end
    # end
  end

  def destroy
    @note.destroy
    flash[:message] = ["You have deleted '#{@note.title}'"]
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :pinned, :user_id)
  end

  def set_note
    @note = Note.find_by(id: params[:id])
  end

  def require_auth
    if @note.user != current_user
      flash[:message] = ["You do not own this note."]
      redirect_to "/dashboard"
    end
  end

end