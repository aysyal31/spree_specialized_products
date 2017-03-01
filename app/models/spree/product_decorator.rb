Spree::Product.class_eval do


 belongs_to :specialized_sku_store

 def self.filter_products(user)
 	if user.present? && user.specialized_sku_stores.present?
 			where("specialized_sku_store_id is NULL OR specialized_sku_store_id in (?)", user.specialized_sku_stores.pluck(:id))
 	else
 		where(" specialized_sku_store_id is NULL")
 	end

 end



end