Deface::Override.new(virtual_path: 'spree/users/show',
  name: 'add_specialized_sku_stores_to_account_page',
  insert_after: "#user-info",
  text: "
    <dl id='specialized-sku-store-info'>
      <dt><%= Spree.t(:specialized_sku_stores) %></dt>
      <% if @user.specialized_sku_stores.present? %>
      <dd><%= @user.specialized_sku_stores.first %> (<%= link_to Spree.t(:details), spree.specialized_sku_store_path(@user.specialized_sku_stores.first) %>)</dd>
      <% else %>
         <%= link_to 'Add' ,spree.new_specialized_sku_store_path() %>
       <%end%>
    </dl>
  ")