module Thumbnailer
  class YouTube < Thumbnailer::Base
    def initialize(uri)
      params = CGI.parse(uri.query)
      temp_img_url = "http://img.youtube.com/vi"
      @small_thumb_image = "#{temp_img_url}/#{params['v']}/2.jpg"
      @thumb_image = "#{temp_img_url}/#{params['v']}/0.jpg"
      @embed_url = "http://www.youtube.com/v/#{params['v']}"
    end
  end
end

