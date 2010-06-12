module Thumbnailer
  class Fetcher
    attr_reader :media
    def initialize(url)
      @media = Thumbnailer::Parser.new(url).worker
    end
  end
end

