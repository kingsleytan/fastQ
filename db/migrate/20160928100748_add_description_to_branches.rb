class AddDescriptionToBranches < ActiveRecord::Migration[5.0]
  def change
    add_column :branches, :description, :text
  end
end
