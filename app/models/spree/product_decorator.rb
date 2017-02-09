Spree.product_class.class_eval do

  has_many :user_specialized_sku_stores

  def allow_special_store?
    self.allow_special_store.present?
  end

  def update_allow_special_store
   self.allow_special_store = true
   self.save
  end

  



end