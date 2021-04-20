class OrderShipping
  include ActiveModel::Model
  attr_accessor :postcode, :shipping_area_id, :city, :bloc, :building, :phone_number, :user_id, :item_id, :token 

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :city
    validates :bloc
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, shipping_area_id: shipping_area_id, city: city, bloc: bloc, building: building, 
                    phone_number: phone_number, order_id: order.id )
  end
end