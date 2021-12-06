require 'parser_job'

describe ParserJob do
  describe 'run' do
    before do
        @valid_source = "#{RSPEC_ROOT}/fixtures/webserver.log"
        @parser_job = ParserJob.new
    end

    context 'when source is nil' do
      it 'raises ArgumentError' do
        expect { @parser_job.run(source: nil) }
          .to raise_error(ArgumentError)
      end
    end
    context 'when source is blank' do
      it 'raises ArgumentError' do
        expect { @parser_job.run(source: '  ') }
          .to raise_error(ArgumentError)
      end
    end
    context 'when source is valid' do
      it 'does not raise ArgumentError' do
        expect { @log_parser.run(source: @valid_path) }
          .to_not raise_error(ArgumentError)
      end
    end
  end
end