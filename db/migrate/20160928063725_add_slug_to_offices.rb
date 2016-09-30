class AddSlugToOffices < ActiveRecord::Migration[5.0]
  def change
    add_column :offices, :slug, :string
  end
end
