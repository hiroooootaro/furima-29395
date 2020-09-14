class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :day


  VALIO_NAMBER_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 },format:{with: VALIO_NAMBER_REGEX}
    validates :item_image, presence: true
    validates :area_id, numericality: { other_than: 0 } 
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
    validates :user, presence: true

  end

 belongs_to :user, optional: true
end
