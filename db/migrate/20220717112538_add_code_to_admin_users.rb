class AddCodeToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :code, :string
  end
end
