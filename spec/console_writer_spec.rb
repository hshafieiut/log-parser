
require 'console_writer'
require 'ostruct'

describe ConsoleWriter do
    before do
        @items = [OpenStruct.new({'key': 'k1', 'value': 'v1'}), OpenStruct.new({'key': 'k2', 'value': 'v2'})]
        @console_writer= ConsoleWriter.new
    end

    describe 'write_items' do
        it 'should write output based on key values in terminal' do
            expect do
                @console_writer.write_items(items: @items, key: 'key', value: 'value',title: 'Test Title')
            end.to output(
            <<~DOC

            Test Title

            k1 v1 
            k2 v2 
            DOC
            ).to_stdout
        end
    end

end