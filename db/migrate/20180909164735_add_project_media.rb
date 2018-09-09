class AddProjectMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :media, :string
  end
end
