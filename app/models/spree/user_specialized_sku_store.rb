class Spree::UserSpecializedSkuStore < ActiveRecord::Base
  belongs_to :user
  belongs_to :specialized_sku_store
end
