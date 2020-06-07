class RemoveNumberOfLikesColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :number_of_likes
  end
end
