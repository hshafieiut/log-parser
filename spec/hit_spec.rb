require 'hit'

describe Hit do
  describe 'initialize' do
    context 'when uri is nil' do
      it 'raises ArgumentError' do
        expect { Hit.new(uri: nil, ip: '126.318.035.038') }
          .to raise_error(ArgumentError)
      end
    end
    context 'when uri is blank' do
      it 'raises ArgumentError' do
        expect { Hit.new(uri: '  ', ip: '126.318.035.038') }
          .to raise_error(ArgumentError)
      end
    end
    context 'when both are present' do
      it 'does not raise ArgumentError' do
        expect { Hit.new(uri: '/contact', ip: '126.318.035.038') }
          .to_not raise_error(ArgumentError)
      end
    end
    context 'when ip is blank' do
      it 'raises ArgumentError' do
        expect { Hit.new(uri: '/contact', ip: ' ') }
          .to raise_error(ArgumentError)
      end
    end
    context 'when ip is nil' do
      it 'raises ArgumentError' do
        expect { Hit.new(uri: '/contact', ip: nil) }
          .to raise_error(ArgumentError)
      end
    end
  end
end
