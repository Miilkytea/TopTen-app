class ListsController < ApplicationController
  # before_action :authenticate, only: [:edit, :update]
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def show 
    @list = List.find(params[:id])
    @item = Item.new
  end

  def update
    @list = List.find(params[:id])
    if @lists.update_attributes(list_params)
      redirect_to current_user
    else 
      render 'edit'
    end
  end

  def create
    @list = List.new(list_params)
    if @list.save 
      current_user.lists << @list
      redirect_to user_list_path(@list, current_user), notice: "List added!"
    else 
     render 'new'
    end 
  end

  def destroy
    @list = List.find(params[:id])
    if list.destroy
       redirect_to current_user, notice: "List removed!"
    else 
      flash.now.alert = "Error attempting to delete list."
      redirect_to current_user
    end
  end

private

  def list_params
    params.require(:list).permit(:title, :topic, :image_url, :description)
  end
end