RSpec.describe Web::Views::Goals::New, type: :view do
  let(:message)   { 'Title must be filled' }
  let(:params)    { OpenStruct.new(valid?: false, error_messages: [message]) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/goals/new.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays a list of errors when params contain errors' do
    expect(rendered).to include('There was a problem with your submission')
    expect(rendered).to include(message)
  end
end
