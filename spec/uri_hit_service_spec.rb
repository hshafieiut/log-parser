
require 'uri_hits'
require 'stat_builder'
require 'uri_hit_service'

describe UriHitService do
    before do
        @valid_source = "#{RSPEC_ROOT}/fixtures/webserver.log"
        @template = LineTemplates::UriHitTemplate
        @file_processor = FileProcessor.new(path: @valid_source, template: @template)
        @items =  @file_processor.process
        @uri_hit_service = UriHitService.new
    end

    describe 'calculate' do
        it 'calculates hits and builds stats' do
            expect(@uri_hit_service.calculate(@items)).to be_instance_of(StatBuilder)
            expect(@uri_hit_service.calculate(@items).items.size).to equal(6)
        end
    end

    describe 'calculate_hits' do
        it 'enumarates hits and updates the uri_hits hash' do
            expect(@uri_hit_service.send(:calculate_hits,@items)[0]).to be_instance_of(Hit)
            expect(@uri_hit_service.send(:calculate_hits,@items).length).to equal(10)
        end
    end
end