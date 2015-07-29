class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end
    
  def create
    @item = Item.new(item_params)
    @list = List.find(params[:user_id])
    if @item.save
      redirect_to user_list_path(current_user, @list), notice: "A thingy added to your list!"
    else render 'new'
    end  
  end

  def destroy
    @item = Item.find(params[:id])
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
