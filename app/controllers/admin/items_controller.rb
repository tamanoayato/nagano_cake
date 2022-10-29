class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:post] = "successfully created."
      redirect_to admin_items_path(@item.id)
    else
      @item = Item.new
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to edit_admin_items_path(@items.id)
    else
      render :edit
    end
  end

  private
   def item_params
     params.require(:item).permit(:name, :price, :introduction, :is_active, :genre_id, :ima)

   end
end
