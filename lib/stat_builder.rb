class StatBuilder
    attr_reader :items, :total_hits, :unique_hits

    def initialize(items:)
        @items= items
        @total_hits = sorted_hits
        @unique_hits = sorted_hits('unique_hits')
    end

    private

    def sorted_hits(attr='hits_counter')
        items.values.sort_by { |stats| [-stats.send(attr)] }
    end
end