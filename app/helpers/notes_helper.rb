module NotesHelper
  def edit(note)
    link_to("edit", edit_note_path(note), :class => 'btn btn-outline-secondary')
  end

  def delete(note)
    button_to("delete", note, method: :delete, :class => 'btn btn-outline-danger')
  end

  def pin(note)
    btn_text = note.pinned? ? "pinned" : "pin"

    button_to btn_text, toggle_pinned_note_path(note), method: :patch, :class => 'btn btn-outline-warning pin-btn', :remote => true
  end

  def date(note)
    note.created_at.strftime('%A, %b %e, %Y @ %I:%M%p')
  end

  def note_meta(note)
    "(Created by #{note.user.full_name} #{date(note)})"
  end
  
  def view(note)
    link_to "view" ,note_path(note), :class => 'btn btn-outline-primary'
  end

  def pin_icon(note)
    content_tag :i, nil, :class => "fas fa-thumbtack fa-lg" if note.pinned?
  end
end
