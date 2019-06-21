class StoresController < ApplicationController

  def index
    @stores = Store.all
    @most_inventory = @stores.max {|store| store.products.count}
  end

  def show
    @store = Store.find(params[:id])
    @products = @store.products
  end

  def filter
    @stores = []
    all_stores = Store.all
    @list = List.find(session[:list_id])
    @products = @list.products

    @products.each do |product|
      all_stores.each do |store|
        if store.products.include?(product) && !@stores.include?(store)
          @stores << store
        end
      end
    end
  end

  def my_stores
    @user = User.find(session[:user_id])
    @stores = @user.stores
  end

end
