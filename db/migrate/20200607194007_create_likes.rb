class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :number_of_likes
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
