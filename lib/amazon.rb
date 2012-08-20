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
end
