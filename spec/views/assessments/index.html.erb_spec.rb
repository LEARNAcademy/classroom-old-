require 'rails_helper'

RSpec.describe "assessments/index", type: :view do
  before(:each) do
    assign(:assessments, [
      Assessment.create!(
        student: nil,
        week: 2,
        status: 3,
        comprehension: 4,
        reviewer: "Reviewer",
        notes: "MyText"
      ),
      Assessment.create!(
        student: nil,
        week: 2,
        status: 3,
        comprehension: 4,
        reviewer: "Reviewer",
        notes: "MyText"
      )
    ])
  end

  it "renders a list of assessments" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Reviewer".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
