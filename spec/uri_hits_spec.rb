# frozen_string_literal: true

require 'uri_hits'

describe UriHits do
  before do
    @uri_hits = UriHits.new(uri: '/help_page/1')
  end

  describe 'add' do
    context 'for the first hit' do
      it 'should increment hits counter' do
        expect { @uri_hits.add(ip: '126.318.035.038') }
          .to change(@uri_hits, :hits_counter).from(0).to(1)
      end
      it 'should increment unique hits' do
        expect { @uri_hits.add(ip: '126.318.035.038') }
          .to change(@uri_hits, :unique_hits).from(0).to(1)
      end
    end
    context 'in case of non unique ip' do
      before do
        @uri_hits.add(ip: '126.318.035.038')
      end
      it 'should increment hits counter' do
        expect { @uri_hits.add(ip: '126.318.035.038') }
          .to change(@uri_hits, :hits_counter).from(1).to(2)
      end
      it 'should not increment unique hits' do
        expect { @uri_hits.add(ip: '126.318.035.038') }
          .to_not change(@uri_hits, :unique_hits).from(1)
      end
    end
  end

  context 'no hits at all' do
    describe 'hits_counter' do
      it 'should be in initial state' do
        expect(@uri_hits.hits_counter).to eq 0
      end
    end
    describe 'unique_hits' do
      it 'should be in initial state' do
        expect(@uri_hits.unique_hits).to eq 0
      end
    end
  end
end