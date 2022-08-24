require "rails_helper"

RSpec.describe "students/show", type: :view do
  before(:each) do
    @cohort = assign(:cohort, Cohort.create(
      id: 1
    ))
    @student = assign(:student, Student.create!(
      cohort: nil,
      absences: 1,
      cohort_id: 1,
      pref_name: "John Doe"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
