class Deal < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_deals, foreign_key: 'deal_id', dependent: :destroy
  has_many :groups, through: :group_deals

  validates :user, presence: true
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
