class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :chapter
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
