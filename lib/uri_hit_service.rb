class UriHitService
    attr_reader :uri_hits

    def initialize
        @uri_hits = {}
    end
    
    def calculate(items)
        calculate_hits(items) 
        build_stats
    end
    
    
    private

    def build_stats
        StatBuilder.new(items: uri_hits)
    end
    
    def find_or_initialize_uri_hits(uri)
        unless uri_hits.key?(uri)
          uri_hits[uri] = UriHits.new(uri: uri)
        end
        uri_hits[uri]
    end
    
    def calculate_hits(hits)
        hits.each do |hit|
            uri_hits = find_or_initialize_uri_hits(hit.uri)
            uri_hits.add(ip: hit.ip)
        end
    end
end