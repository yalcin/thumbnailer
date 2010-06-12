module Thumbnailer
  class TwitPic < Thumbnailer::Base
    def initialize(uri)
      pic_id = uri.path.split('/')[1]
      @embed_url = uri.to_s
      @thumb_image = "http://twitpic.com/show/thumb/#{pic_id}"
      @small_thumb_image = "http://twitpic.com/show/mini/#{pic_id}"
    end
  end
end

