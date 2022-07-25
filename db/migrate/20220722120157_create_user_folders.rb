class CreateUserFolders < ActiveRecord::Migration[6.1]
  def change
    create_table :user_folders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
