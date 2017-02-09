class AddAllowSpecialSkuViewToSpreeUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :allow_special_sku, :boolean
  end
end
