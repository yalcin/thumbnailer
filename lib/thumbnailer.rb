require "uri"
require "cgi"
require "open-uri"
require "xml"
require "yaml"


require "constants"
require "thumbnailer/base"
require "thumbnailer/sites/youtube"
require "thumbnailer/sites/flickr"
require "thumbnailer/sites/video_google"
require "thumbnailer/sites/twitpic"
require "thumbnailer/sites/dailymotion"
require "thumbnailer/sites/vimeo"
require "thumbnailer/sites/websnapr"

SITES = {"youtube\..*?\/watch" => Thumbnailer::YouTube,
         "flickr" => Thumbnailer::Flickr,
         "video\.google\..*?\/videoplay" => Thumbnailer::VideoGoogle,
         "twitpic\.com\/.*?(?!\..*?)" => Thumbnailer::TwitPic,
         "dailymotion\.com\/video" => Thumbnailer::Dailymotion,
         "vimeo\.com\/" => Thumbnailer::Vimeo,
         ".*?" => Thumbnailer::WebSnapr
         }

require "thumbnailer/parser"
require "thumbnailer/fetcher"

