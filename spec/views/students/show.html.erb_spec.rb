require "rails_helper"

RSpec.describe "students/show", type: :view do
  before(:each) do
    @cohort = assign(:cohort, Cohort.create(
      cohort_name: "Charlie",
      year: 1990
    ))
    @student = assign(:student, Student.create!(
      cohort: @cohort,
      absences: 1,
      cohort_id: 1,
      pref_name: "John Doe",
      user_attributes: {email: "test@example.com", name: "Test User"}
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
