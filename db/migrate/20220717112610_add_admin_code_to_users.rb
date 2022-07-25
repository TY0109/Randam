class AddAdminCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin_code, :string
  end
end
