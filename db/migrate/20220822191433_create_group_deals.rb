class CreateGroupDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :group_deals do |t|
      t.references :group, foreign_key: { to_table: 'groups' }
      t.references :deal, foreign_key: { to_table: 'deals' }

      t.timestamps
    end
  end
end