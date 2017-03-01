class Spree::SkuStoresAuth < ActiveRecord::Base


  def self.accessibles
    [ "email" , "seller_id", "pincode","marketplace"]
  end



end