class CreateLikesPairs < ActiveRecord::Migration[6.0]
  def change
    create_table :likes_pairs do |t|
      t.references :article, foreign_key: true
      t.integer :likes_count
      t.timestamps
    end
  end
end
