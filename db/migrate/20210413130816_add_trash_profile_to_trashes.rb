class AddTrashProfileToTrashes < ActiveRecord::Migration[5.0]
  def change
    add_column :trashes, :trash_profile, :string
  end
end
