class ItemsController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def create
    @item = Item.new(params[:item])
    @item.user = current_user

    if @item.save
      respond_with @item
    end
  end

  def index
    @items = Item.all

    respond_with @items
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])

    respond_with @item
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    respond_to do |format|
      format.json do
        render :json => {
          :status => "ok"
        }
      end
    end
  end
end
