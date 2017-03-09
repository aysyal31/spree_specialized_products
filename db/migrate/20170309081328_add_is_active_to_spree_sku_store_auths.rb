class AddIsActiveToSpreeSkuStoresAuths < ActiveRecord::Migration
  def change
    add_column :spree_sku_stores_auths, :is_active, :boolean
  end
end
