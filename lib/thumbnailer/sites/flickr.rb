module Thumbnailer
  class Flickr < Thumbnailer::Base
    def initialize(uri)
      if uri.path =~ /\/photos\/.*?\/\d+/
        image_id = uri.path.split(/\/photos\/.*?\/(\d+)/)[1]
        data = open("http://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=#{FLICKR_KEY}&photo_id=#{image_id}")
        doc = XML::Parser.string(data.read).parse.find("//rsp/sizes/size")
        doc.each { |item|
          case item['label']
            when 'Thumbnail'
              @thumb_image = item['source']
            when 'Square'
              @small_thumb_image = item['source']
            when 'Medium'
              @embed_url = item['source']
          end
        }
      end
    end
  end
end

