RSpec.describe Web::Controllers::Goals::Index, type: :action do
  let(:action)     { described_class.new }
  let(:params)     { Hash[] }
  let(:repository) { GoalRepository.new }

  before do
    repository.clear

    @goal = repository.create(title: 'Learn Hanami')
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all goals' do
    action.call(params)
    expect(action.exposures[:goals]).to eq([@goal])
  end
end
