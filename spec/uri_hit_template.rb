
require 'line_templates'
require 'hit'


describe LineTemplates::UriHitTemplate do
  describe 'run' do
    before do
      @line = '/help_page/1 126.318.035.038'
      @uri_hit_template =  LineTemplates::UriHitTemplate.new(line: @line)
    end

    describe 'run' do
        it 'should return a Hit object' do
            expect(@uri_hit_template.run[0]).to be_instance_of(Hit)
            expect(@uri_hit_template.run.length).to eq(1)
        end
    end
  end
end