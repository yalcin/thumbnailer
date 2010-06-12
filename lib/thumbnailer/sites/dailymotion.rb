module Thumbnailer
  class Dailymotion < Thumbnailer::Base
    def initialize(uri)
      video_id = uri.path.split('video/')[1]
      @embed_url = "http://www.dailymotion.com/swf/video/#{video_id}"
      @thumb_image = "http://www.dailymotion.com/thumbnail/313x240/video/#{video_id}"
      @small_thumb_image = "http://www.dailymotion.com/thumbnail/160x120/video/#{video_id}"
    end
  end
end

