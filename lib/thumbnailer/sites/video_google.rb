module Thumbnailer
  class VideoGoogle < Thumbnailer::Base
    def initialize(uri)
      begin
        params = CGI.parse(uri.query)
        doc = open("http://video.google.com/videofeed?docid=#{params['docid']}").read
#        @thumb_image = CGI.unescape(doc.scan(/thumbnailUrl\\x3d(.*?)\\x26/im)[0][0].gsub(/http:\/\/(\d+).*?/, "http://2"))
        doc = XML::Parser.string(doc).parse.find("//channel/item/media:group/media:thumbnail")

        @thumb_image = doc[0]['url']
        @small_thumb_image = @thumb_image
        @embed_url = "#{uri.scheme}://#{uri.host}/googleplayer.swf?docId=#{params['docid']}"
      rescue
      end
    end
  end
end

