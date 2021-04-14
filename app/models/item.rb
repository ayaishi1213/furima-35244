class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :details_status_id, numericality: { other_than: 1 } 
    validates :details_category_id, numericality: { other_than: 1 } 
    validates :shopping_charge_id, numericality: { other_than: 1 } 
    validates :shipping_area_id, numericality: { other_than: 1 } 
    validates :delivery_time_id , numericality: { other_than: 1 } 
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字のみを使用してください' } do
    validates :price
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :details_status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shopping_charge
  belongs_to_active_hash :details_category
  
end
