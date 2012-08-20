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

  def self.add_to_cart(amazon_id, quantity)
    req = Amazon.api.build(
      'Operation' => 'CartCreate',
      'Item.1.Quantity' => quantity,
      'Item.1.ASIN' => amazon_id,
      'AssociateTag' => AMAZON_CONFIG['tag']
    )

    req
  end
end
