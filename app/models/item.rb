class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :day


  VALIO_NAMBER_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 },format:{with: VALIO_NAMBER_REGEX}
    validates :item_image
    validates :area_id, numericality: { other_than: 0 } 
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
    validates :user
  end

 belongs_to :user, optional: true
end
