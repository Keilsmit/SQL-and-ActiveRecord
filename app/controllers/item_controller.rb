class ItemController < ApplicationController

  # Lists all the posts
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
     # render text: params[:post].inspect
     @item = Item.new
     @item.title = params[:item][:title]
     @item.description = params[:item][:description]
     @item.price = params[:item][:price]
     @item.category = params[:item][:category]

     @item.save
     redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    render :new
  end

  def update
    @item = Item.find(params[:id])

    @item.title = params[:item][:title]
    @item.description = params[:item][:description]
    @item.price = params[:item][:price]
    @item.category = params[:item][:category]
    @item.save
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :category)
  end


end
