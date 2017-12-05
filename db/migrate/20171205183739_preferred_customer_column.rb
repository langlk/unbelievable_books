class PreferredCustomerColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :preferred, :boolean
  end
end
