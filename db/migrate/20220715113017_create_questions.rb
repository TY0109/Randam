class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :chapter
      t.string :folder_in
      t.string :user_id
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
