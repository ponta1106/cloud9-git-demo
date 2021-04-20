class AddPickUpProfileToPickUp < ActiveRecord::Migration[5.0]
  def change
    add_column :pick_ups, :pick_up_profile, :string
  end
end
