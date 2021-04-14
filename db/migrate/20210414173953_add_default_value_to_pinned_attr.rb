class AddDefaultValueToPinnedAttr < ActiveRecord::Migration[6.0]
  def change
    change_column_default :notes, :pinned, false
  end
end
