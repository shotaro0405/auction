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

  def create
    #formから投げられたデータを受け取る
    @item = Item.new(item_params)

    #これを保存する
    @item.save

    #show.html.erbに飛ばす
    redirect_to "/items/#{@item.id}"
  end

def edit
  @item = Item.find(params[:id])

end

def update
  # :idでItem.find
  @item = Item.find(params[:id])

  #update_attributesメソッドで上書き保存
  @item.update_attributes(item_params)
  redirect_to "/items/#{@item.id}"
end

  private
  def item_params
    #params.require(:key).permit(:filter)
    params.require(:item).permit(
      :name,
      :description,
      :seller_id,
      :price,
      :email,
      :image_url
      )
  end

end
