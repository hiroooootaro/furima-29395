class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash [:area, :delivery_fee, :category, :condition, :day]
end
