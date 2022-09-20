require "rails_helper"

RSpec.describe "assessments/show", type: :view do
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
