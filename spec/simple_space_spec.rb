
require 'lexer'
require 'lexer_types'


describe LexerTypes::SimpleSpace do
  describe 'run' do
    before do
        @valid_input = '/help_page/1 126.318.035.038'
        @lexer = LexerTypes::SimpleSpace.new(line: @valid_input)
    end

    describe 'run' do
        it 'tokenizes the valid input' do
            expect( @lexer.run.length).to eq(2)
        end
    end
  end
end