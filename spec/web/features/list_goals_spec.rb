require 'features_helper'

RSpec.describe 'Listing goals' do
  before do
    repository = GoalRepository.new
    repository.clear

    repository.create(title: 'Learn Hanami')
    repository.create(title: 'Finish This App')
  end

  it 'displays each goal' do
    visit '/goals'

    within '#goals' do
      expect(page).to have_css('.goal', count: 2)
    end
  end
end
