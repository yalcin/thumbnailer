Welcome to thumbnailer
--------------------

thumbnailer is a Ruby library for getting thumbnail images from various sites with idiotic artificial intelligence.

Supported sites
---------------

- YouTube
- Flickr
- TwitPic
- Google Video
- Vimeo
- Dailymotion
- For unlisted sites WebSnapr

Configuration
--------------
You need Flickr and WebSnapr Api key and you must set keys in thumbnailer.yml file.
Sample configuration file under the example directory. If you are using Rails you may create the YOUR_RAILS_APP/config/thumbnailer.yml

What is Idiotic Artificial Intelligence?
----------------------------------------
Probably nothing.

here is an example:
  module Thumbnailer
    class VideoGoogle < Thumbnailer::Base
      def initialize(uri)
        begin
          params = CGI.parse(uri.query)
          doc = open("http://video.google.com/videofeed?docid=#{params['docid']}").read
          doc = XML::Parser.string(doc).parse.find("//channel/item/media:group/media:thumbnail")

          @thumb_image = doc[0]['url']
          @small_thumb_image = @thumb_image
          @embed_url = "#{uri.scheme}://#{uri.host}/googleplayer.swf?docId=#{params['docid']}"
        rescue
        end
      end
    end
  end

Download
--------

- [sudo] gem i thumbnailer-ruby
- http://github.com/yalcin/thumbnailer
- git clone git://github.com/yalcin/thumbnailer.git

Usage
-----
    require 'rubygems'
    require 'thumbnailer'

    s = Thumbnailer::Fetcher.new('http://www.vimeo.com/12077673')
    p s.media.thumb_image
    p s.media.embed_url

Authors
-------
- Yalcin ACIKYILDIZ (yalcin@webliyacelebi.com)


This library is released under the terms of the GNU/GPL.

