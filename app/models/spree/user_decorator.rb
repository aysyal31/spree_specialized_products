Spree.user_class.class_eval do

  has_many :user_specialized_sku_stores
  has_many :specialized_sku_stores  , through: :user_specialized_sku_stores

  def allow_special_store?
    self.allow_special_store.present?
  end

  def update_allow_special_store
   self.allow_special_store = true
   self.save!
  end

  def set_special_stores

  	self.user_specialized_sku_stores = Spree::SpecializedSkuStore.first
  	self.save!

  end

end