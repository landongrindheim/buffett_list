require 'features_helper'

RSpec.describe 'Listing goals' do
  it 'displays each goal' do
    visit '/goals'

    within '#goals' do
      expect(page).to have_css('.goal', count: 2)
    end
  end
end
