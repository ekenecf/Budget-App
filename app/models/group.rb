class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_deals, foreign_key: 'group_id', dependent: :destroy
  has_many :deals, through: :group_deals

  validates :user, presence: true
  validates :name, presence: true
  validates :icon, presence: true

  def amount
    amount = 0
    deals.each { |deal| amount += deal.amount }
    amount
  end
end
