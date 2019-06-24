RSpec.describe Web::Controllers::Goals::Create, type: :action do
  let(:action)    { described_class.new }
  let(:params)    do
    Hash[goal: {
      title: 'Learn Hanami',
      description: 'Learn to use the Hanami framework',
      }
    ]
  end
  let(:repository) { GoalRepository.new }

  before do
    repository.clear
  end

  context 'with valid params' do
    it 'creates a goal' do
      action.call(params)
      goal = repository.last

      expect(goal.id).to_not be_nil
    end

    it 'redirects to the goals list' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/goals')
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[goal: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in the params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:goal, :title)).to eq(['is missing'])
    end
  end
end
