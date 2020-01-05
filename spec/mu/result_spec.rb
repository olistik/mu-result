RSpec.describe Mu::Result do
  it 'has a version number' do
    expect(Mu::Result::VERSION).not_to be nil
  end

  it 'can correctly query the status of the result' do
    expect(Mu::Result.success).to be_success
    expect(Mu::Result.error).to be_error
  end

  it 'provides default result codes' do
    expect(Mu::Result.success.code).to eql(:ok)
    expect(Mu::Result.error.code).to eql(:ko)
  end

  it 'allows the use of custom result codes' do
    expect(Mu::Result.success.code!(:a_kind_of_success).code).to eql(:a_kind_of_success)
    expect(Mu::Result.error.code!(:a_terrible_mistake).code).to eql(:a_terrible_mistake)
  end

  it 'provides no payload by default' do
    expect(Mu::Result.success.data).to be_nil
    expect(Mu::Result.error.data).to be_nil
  end

  it 'allows the use of custom result payloads' do
    expect(Mu::Result.success({never: :gonna, give_you: :up}).data).to eql({never: :gonna, give_you: :up})
    expect(Mu::Result.error({never: :gonna, let_you: :down}).data).to eql({never: :gonna, let_you: :down})
  end

  describe '#unwrap' do
    let(:result) { Mu::Result.success(user: 'olistik', role: 'developer') }

    context 'when retrieving a field' do
      context 'when the field is present' do
        it 'returns the value of corresponding key' do
          expect(result.unwrap(:user)).to eql('olistik')
          expect(result.unwrap(:role)).to eql('developer')
        end
      end

      context 'when the field is NOT present' do
        it 'raises an exception' do
          expect { result.unwrap(:users) }.to raise_error(StandardError)
          expect { result.unwrap(:foo) }.to raise_error(StandardError)
        end
      end
    end
  end
end
