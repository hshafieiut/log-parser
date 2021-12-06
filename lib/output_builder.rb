class OutputBuilder
    attr_reader :stats
    def initialize(stats:, output:)
        @stats = stats
        @console_writer = output.new
    end
    def build
        @console_writer.write_items(items: stats.total_hits, key: 'uri', value: 'hits_counter' ,title: 'Total Hits')
        @console_writer.write_items(items: stats.unique_hits, key: 'uri', value: 'unique_hits' ,title: 'Unique Hits')
    end
end