RSpec.describe Web::Views::Goals::Index, type: :view do
  let(:exposures)   { Hash[goals: []] }
  let(:template)    { Hanami::View::Template.new('apps/web/templates/goals/index.html.erb') }
  let(:view)        { described_class.new(template, exposures) }
  let(:rendered)    { view.render }
  let(:placeholder) { %(<p class="placeholder">It looks like there aren't any goals yet) }

  it 'exposes #goals' do
    expect(view.goals).to eq exposures.fetch(:goals)
  end

  context 'when there are no goals' do
    it 'displays a placeholder message' do
      expect(rendered).to include(placeholder)
    end
  end

  context 'when there are goals' do
    let(:first_goal)  { Goal.new(title: 'Learn Hanami') }
    let(:second_goal) { Goal.new(title: 'Finish this app') }
    let(:exposures)   { Hash[goals: [first_goal, second_goal]] }

    it 'displays each goal' do
      expect(rendered.scan('class="goal"').length).to eql 2
      expect(rendered).to include(first_goal.title)
      expect(rendered).to include(second_goal.title)
    end

    it 'hides the placeholder message' do
      expect(rendered).to_not include(placeholder)
    end
  end
end
