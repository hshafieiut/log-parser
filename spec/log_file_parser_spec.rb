require 'input_parsers'
require 'file_processor'
require 'line_templates'
require 'line_template'
require 'lexer'
require 'lexer_types'
require 'hit'
require 'uri_hits'
require 'stat_builder'
require 'output_builder'
require 'uri_hit_service'
require 'console_writer'

describe InputParsers::LogFileParser do
  describe 'run' do
    before do
        @valid_source = "#{RSPEC_ROOT}/fixtures/webserver.log"
        @template = LineTemplates::UriHitTemplate
        @calculator = UriHitService
        @output = ConsoleWriter
        @log_file_parser = InputParsers::LogFileParser.new(source: @valid_source, template: @template, calculator: @calculator, output: @output)
    end

    describe 'run' do
        it 'parses log file and generates output' do
            expect(@log_file_parser.run[0]).to be_instance_of(UriHits)
            expect(@log_file_parser.run.length).to eq(6)
        end
    end
  end
end