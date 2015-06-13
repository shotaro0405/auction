class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
   @item = Item.find(params[:id]) #IDでデータベースを検索する
  end

  def new
    @item = Item.new
  end
end
