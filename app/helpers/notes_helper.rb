module NotesHelper
  def edit(note)
    link_to("edit", edit_note_path(note), :class => 'btn btn-secondary')
  end

  def delete(note)
    button_to("delete", note, method: :delete, :class => 'btn btn-danger')
  end

  def pin(note)
    btn_text = note.pinned? ? "pinned" : "pin"

    button_to btn_text, note, method: :patch, :class => 'btn btn-warning'
  end

  def date(note)
    note.created_at.strftime('%A, %b %e, %Y @ %I:%M%p')
  end

  def note_meta(note)
    "(Created by #{note.user.full_name} #{date(note)})"
  end
end
