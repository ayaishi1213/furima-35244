class AddItemIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :item, null: false, foreign_key: true
  end
end
