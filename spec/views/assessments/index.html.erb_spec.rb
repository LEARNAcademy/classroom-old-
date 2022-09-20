require "rails_helper"

RSpec.describe "assessments/index", type: :view do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }
  before(:each) do
    assign(:cohort, Cohort.create(
      id: 1
    ))
    assign(:student, Student.new(
      cohort: nil,
      absences: 1,
      pref_name: "John Doe",
      cohort_id: 1
    ))
    assign(:assessment, Assessment.new(
      student: nil,
      week: 1,
      status: 1,
      comprehension: 1,
      reviewer: "MyString",
      notes: "MyText"
    ))
    Assessment.create! valid_attributes
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
