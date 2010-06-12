module Thumbnailer
  class Parser
    attr_reader :uri, :worker

    def initialize(url)
      @uri = URI.parse(url)

      SITES.each {|k, w|
        if url =~ /#{k}/
          @worker = w.new(@uri)
        end
      }
    end
  end
end

