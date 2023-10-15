class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_cord, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only half-width number"}
  end

  def save
    order = Order.create(item_id: params[:item_id], user_id: current_user.id)
    Address.create(zip_code: zip_cord, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end