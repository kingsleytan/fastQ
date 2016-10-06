class AddImageToOffices < ActiveRecord::Migration[5.0]
  def change
    add_column :offices, :image, :string
  end
end
