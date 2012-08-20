# Sample shopping cart request
# req = Amazon.api.build
#   'Operation' => 'CartCreate',
#   'Item.1.Quantity' => 1,
#   'Item.1.OfferListingId' => '0001846655',
#   'AssociateTag' => AMAZON_CONFIG['tag'

require 'amazon'

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
    @items = current_user.items

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
        render :json => { :status => "ok" }
      end
    end
  end

  def search
    res = Amazon.api.search :all,
      keywords: params[:search],
      response_group: ['Images', 'ItemIds', 'ItemAttributes']

    items = res.find('Item')
    images = res.find('ImageSet')
    attrs = res.find('ItemAttributes')

    image_size = 'MediumImage'

    results = []

    3.times do |n|
      results << {
        :amazon_id => items[n]['ASIN'],
        :image => images[n][image_size]['URL'],
        :image_height => images[n][image_size]['Height']['__content__'],
        :image_width => images[n][image_size]['Width']['__content__'],
        :price => attrs[n]['ListPrice']['FormattedPrice'],
        :title => attrs[n]['Title'],
      }
    end

    respond_to do |format|
      format.json do
        render :json => results
      end
    end
  end
end
