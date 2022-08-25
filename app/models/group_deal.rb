class GroupDeal < ApplicationRecord
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'
  belongs_to :deal, class_name: 'Deal', foreign_key: 'deal_id'
end
