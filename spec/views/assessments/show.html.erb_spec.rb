require 'rails_helper'

RSpec.describe "assessments/show", type: :view do
  before(:each) do
    @assessment = assign(:assessment, Assessment.create!(
      student: nil,
      week: 2,
      status: 3,
      comprehension: 4,
      reviewer: "Reviewer",
      notes: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Reviewer/)
    expect(rendered).to match(/MyText/)
  end
end
