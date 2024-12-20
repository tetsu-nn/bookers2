class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.text :body, limit: 200

      t.timestamps
    end
  end
end
