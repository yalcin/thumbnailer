module Thumbnailer
  class WebSnapr < Thumbnailer::Base
    def initialize(uri)
      @small_thumb_image = "http://images.websnapr.com/?size=S&key=#{WEBSNAPR_KEY}&url=#{uri.to_s}"
      @thumb_image = "http://images.websnapr.com/?size=T&key=#{WEBSNAPR_KEY}&url=#{uri.to_s}"
      @embed_url = nil
    end
  end
end

