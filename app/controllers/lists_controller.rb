class ListsController < ApplicationController
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
  end

  def update
    @list = List.find(params[:id])
    if @lists.update_attributes(list_params)
    redirect_to lists_index_path
    else 
    render 'edit'
    end
  end

  def create
    @list = List.find(params(list_params))
    if @list.save 
      redirect_to lists_index_path
    else 
     render 'new'
    end 
  end

  def destroy
    @list = List.find(params[:id]).destroy
    redirect_to lists_index_path
  end
end

private

def list_params
  params.require(:list).permit(:title, :image_url, :description)
end