
require 'uri_hits'
require 'stat_builder'
require 'uri_hit_service'

describe StatBuilder do
    before do
        @uri_hits_1 = UriHits.new(uri: '/help_page/1')
        @uri_hits_1.add(ip: '126.318.035.038')
        @uri_hits_1.add(ip: '126.318.035.039')
        @uri_hits_2 = UriHits.new(uri: '/contact')
        @uri_hits_2.add(ip: '184.123.665.067')        
        @stat_builder = StatBuilder.new(items: {'/help_page/1': @uri_hits_1, '/contact': @uri_hits_2})
    end

    describe 'sorted_hits' do
        it 'builds sorted hits' do
            expect(@stat_builder.send(:sorted_hits, 'unique_hits')[0]).to be_instance_of(UriHits)
            expect(@stat_builder.send(:sorted_hits, 'unique_hits')[1].uri).to eq('/contact')
            expect(@stat_builder.send(:sorted_hits, 'unique_hits').size).to eq(2)
        end
    end
end