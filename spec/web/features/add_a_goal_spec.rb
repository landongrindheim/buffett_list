require 'features_helper'

RSpec.describe 'Add a goal' do
  after do
    GoalRepository.new.clear
  end

  it 'creates a new goal' do
    goal_title = 'Learn Hanami'
    visit '/goals/new'

    within 'form#goal-form' do
      fill_in 'Title', with: 'Learn Hanami'
      fill_in 'Description', with: 'Learn to use the Hanami framework'

      click_button 'Create'
    end

    expect(page).to have_current_path '/goals'
    expect(page).to have_content goal_title
  end

  it 'displays errors when params have invalid attributes' do
    visit '/goals/new'

    within 'form#goal-form' do
      click_button 'Create'
    end

    expect(current_path).to eq '/goals'
    expect(page).to have_content('Title must be filled')
  end
end
