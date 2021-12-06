require 'file_processor'
require 'line_templates'
require 'line_template'
require 'lexer'
require 'lexer_types'
require 'hit'

describe FileProcessor do
  describe 'process' do
    before do
      @log_size = 10
      @valid_path = "#{RSPEC_ROOT}/fixtures/webserver.log"
      @invalid_path = "#{RSPEC_ROOT}/fixtures/missing.log"
      @valid_template = LineTemplates::UriHitTemplate
      @invalid_template = nil
    end

    context 'when log file does not exist' do
      it 'raises ArgumentError' do
        expect { FileProcessor.new(path: @invalid_path, template: @valid_template).process }
          .to raise_error(ArgumentError)
      end
    end

    context 'when log file  exist and template doesnt exist' do
        it 'raises ArgumentError' do
          expect { FileProcessor.new(path: @invalid_path, template: @invalid_template).process }
            .to raise_error(ArgumentError)
        end
      end

    context 'when log file exists' do
      it 'does not raise ArgumentError' do
        expect { FileProcessor.new(path: @valid_path, template: @valid_template).process }
          .to_not raise_error(ArgumentError)
      end
      it 'returns array of visits' do
        expect(FileProcessor.new(path: @valid_path, template: @valid_template).process).to include(
          have_attributes(class: Hit, uri: '/help_page/1',
                          ip: '126.318.035.038')
        )
      end
      
      it 'reads entire log' do
        expect(FileProcessor.new(path: @valid_path, template: @valid_template).process.size).to eq @log_size
      end
    end
  end

  describe 'interpret_line' do
    before do
      @valid_path = "#{RSPEC_ROOT}/fixtures/webserver.log"
      @valid_template = LineTemplates::UriHitTemplate
      @processor = FileProcessor.new(path: @valid_path, template: @valid_template)
      @valid_line = '/help_page/1 126.318.035.038'
      @invalid_line = '/contact '
    end

    context 'when input is not valid' do
      it 'returns ArgumentError' do
        expect { @processor.interpret_line(@invalid_line) }
          .to raise_error(ArgumentError)
      end
    end
    context 'when input is valid' do
      it 'does not return ArgumentError' do
        expect { @processor.interpret_line(@valid_line) }
          .to_not raise_error(ArgumentError)
      end
    end
  end
end