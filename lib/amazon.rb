module Amazon
  def self.init
    @api = ::Vacuum.new :product_advertising
    @api.configure do |config|
      config.key = AMAZON_CONFIG['key']
      config.secret = AMAZON_CONFIG['secret']
      config.tag = AMAZON_CONFIG['tag']
    end

    @api
  end

  def self.api
    @api ||= self.init
  end

  # TODO: call this with all the items that are below the buying threshold
  def self.add_to_cart(items)
    items_data = create_items_request(items)

    req = Amazon.api.build(items_data)

    req
  end

  private
  def self.create_items_request(items)
    items_request = {
      'Operation' => 'CartCreate',
      'AssociateTag' => AMAZON_CONFIG['tag'],
    }

    items.each_with_index do |item, index|
      items_request["Item.#{index + 1}.ASIN"] = item['ASIN']
      items_request["Item.#{index + 1}.Quantity"] = item['Quantity']
    end

    items_request
  end
end
