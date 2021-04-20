class AddTrashImageIdToTrashes < ActiveRecord::Migration[5.0]
  def change
    add_column :trashes, :trash_image_id, :string
  end
end
