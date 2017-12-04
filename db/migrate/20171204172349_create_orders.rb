class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.column :account_id, :integer
      t.column :price_total, :integer
      t.column :status, :string
      t.column :raincheck, :boolean

      t.timestamps
    end
  end
end
