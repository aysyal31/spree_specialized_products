class Spree::SpecializedSkuStore < ActiveRecord::Base

	has_many :products
	has_many :user_specialized_sku_stores
	#has_many :users through: :user_specialized_sku_stores

	def show_products
		self.products
	end

end
