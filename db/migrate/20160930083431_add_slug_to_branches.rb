class AddSlugToBranches < ActiveRecord::Migration[5.0]
  def change
    add_column :branches, :slug, :string
  end
end
