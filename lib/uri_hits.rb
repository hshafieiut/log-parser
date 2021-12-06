class UriHits
    require 'set'
    attr_reader :uri, :hits_counter, :unique_hits

    def initialize(uri:)
      @uri = uri
      @hits_counter = 0
      @ips = Set.new
    end
  
    def add(ip:)
      @hits_counter += 1
      @ips.add(ip)
    end
  
    def unique_hits
      @ips.size
    end
  end