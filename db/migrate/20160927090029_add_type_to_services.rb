class AddTypeToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :type, :string
  end
end
