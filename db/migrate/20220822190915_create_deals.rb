class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.string :name
      t.bigint :amount
      t.references :user, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
