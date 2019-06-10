require 'features_helper'

RSpec.describe 'Visiting home page' do
  it 'is successful' do
    visit '/'

    expect(page).to have_content('Welcome to Buffett List')
  end
end
