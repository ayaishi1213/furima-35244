class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                 null: false
      t.text       :description,          null: false 
      t.integer    :details_status_id,    null: false
      t.integer    :details_category_id,  null: false
      t.integer    :shopping_charge_id,   null: false
      t.integer    :shipping_area_id,     null: false  
      t.integer    :delivery_time_id,     null: false  
      t.integer    :price,                null: false
      t.references :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
