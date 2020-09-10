class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
         VALID_FIRST_NAME_KANA_REGEX = /\A([ァ-ン]|ー)+\z/
         VALID_LAST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
         VALID_LAST_NSME_KANA_REGEX = /\A([ァ-ン]|ー)+\z/
      with_options presence: true do
        validates :nickname, presence: true
        validates :first_name, presence: true, format: { with: VALID_FIRST_NAME_REGEX}
        validates :first_name_kana, presence: true, format: { with: VALID_FIRST_NAME_KANA_REGEX}
        validates :last_name, presence: true, format: { with: VALID_LAST_NAME_REGEX}
        validates :last_name_kana, presence: true, format: { with: VALID_LAST_NSME_KANA_REGEX}
        validates :birth_day, presence: true
        validates :password, presence: true
      end
end
