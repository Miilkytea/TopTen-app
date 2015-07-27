class ItemsController < ApplicationController
  before_action :authenticate 
  before_action :authorize  
  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    @list.items << item
    if list.save
      redirect_to lists_index_path(@list), notice: "A thingy added to your list!"
    else render 'new'
    end  
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to lists_index_path(@list), notice: "You removed a thing from your list!"
    else
      flash.now.alert = "Error"
      redirect_to lists_index_path(@list)  
    end 
    
  end
end

private 

def item_params
  params.require(:item).permit(:name, :image_url, :description)
end
