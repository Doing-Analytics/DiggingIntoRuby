require_relative '../../character/monster'

RSpec.describe Character::Monster do
  describe '#initialize' do
    context 'if health is not provide' do
      subject { described_class.new(name: 'Dragon') }
      it 'expect monster1 have 30 health' do
        expect(subject.info[:health]).to eq(30)
      end
    end
  end
end
