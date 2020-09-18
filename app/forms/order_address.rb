class OrderAddress

  include ActiveModel::Model
  attr_accessor :name, :user_id, :item_id, :postal, :prefecture_id, :city, :address,:building_name, :phone_number, :authenticity_token, :token, :order_id

  with_options presence: true do
    validates :phone_number, format: {with:/\A\d{,11}\z/}
    validates :address, format: {with:/\A[ぁ-んァ-ン一-龥]/}
    validates :postal, format: { with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: {other_than: 0, message: 'Select'}
    validates :city, format: {with:/\A[ぁ-んァ-ン一-龥]/}
    validates :user_id
    validates :item_id
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city,address: address, building_name: building_name,phone_number: phone_number,order_id: order.id)
  end

end