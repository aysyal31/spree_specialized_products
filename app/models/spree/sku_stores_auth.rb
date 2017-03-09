class Spree::SkuStoresAuth < ActiveRecord::Base

  validates_presence_of :seller_id , :pincode , :email ,:is_active ,:marketplace
  after_commit :create_user_specialized_sku_stores 


  def self.accessibles
    [ "email" , "seller_id", "pincode","marketplace","is_active"]
  end

   def self.find_accessibles
    [ "email" , "seller_id", "pincode","marketplace"]
  end

  def create_user_specialized_sku_stores

  	if !self.is_active
  		@user = Spree::User.find_by_email(self.email)
  		@store = Spree::Spree::SpecializedSkuStore.find_by_specialized_store_name(self.marketplace)

  		if @user && @store
  			@user_specialized_sku_store = Spree::UserSpecializedSkuStore.where("user_id = ? and specialized_sku" , @user.id, @store.id)
  			@user_specialized_sku_store.destroy_all if @user_specialized_sku_store
  		end
  	end
  end
  

end