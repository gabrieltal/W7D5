class UpdateUserss < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, null: false
    # add_index , unique: true
  end
end
