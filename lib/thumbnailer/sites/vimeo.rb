module Thumbnailer
  class Vimeo < Thumbnailer::Base
    def initialize(uri)
      video_id = uri.path.split('/')[1]
      doc = XML::Parser.string(open("http://vimeo.com/api/v2/video/#{video_id}.xml").read).parse.find("//videos/video/*")
      doc.each {
        |item|
        case item.name
          when "id"
            @embed_url = "http://vimeo.com/moogaloop.swf?clip_id=#{item.content}"
          when "thumbnail_small"
            @small_thumb_image = item.content
          when "thumbnail_medium"
            @thumb_image = item.content
        end
      }
    end
  end
end

