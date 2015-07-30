class ListsController < ApplicationController
  # before_action :authenticate, only: [:edit, :update]
  
  # This is good
  def index
    @lists = User.find(params[:user_id]).lists;
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
    @user = current_user
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      redirect_to user_lists_path(@user, @list)
    else 
      render 'edit'
    end
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.build(list_params)
    if @list.save 
      redirect_to user_list_path(@user, @list), notice: "List added!"
    else 
     render 'new'
    end 
  end

  def destroy
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
    if @list.destroy
       redirect_to user_lists_path, notice: "List removed!"
    else 
      flash.now.alert = "Error attempting to delete list."
      redirect_to user_lists_path
    end
  end

private

  def list_params
    params.require(:list).permit(:user_id, :title, :topic, :image_url, :description)
  end
end