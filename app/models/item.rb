class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :details_status_id
    validates :details_category_id
    validates :shopping_charge_id
    validates :shipping_area_id
    validates :delivery_time_id
  end

  with_options presence: true, inclusion: { in: 300..9_999_999, message: 'は半角数字で300~9,999,999円で設定してください' }, 
                                          format: { with: /\A[0-9]+\z/} do
    validates :price
  end

  belongs_to :user
  has_one_attached :image
  has_one :order
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :details_status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shopping_charge
  belongs_to_active_hash :details_category
  
end
