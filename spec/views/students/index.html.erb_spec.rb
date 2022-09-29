require "rails_helper"

RSpec.describe "students/index", type: :view do
  before(:each) do
    @cohort = assign(:cohort, Cohort.create!(
      cohort_name: "Charlie",
      year: 1990
    ))
    assign(:students, [
      Student.create!(
        absences: 2,
        cohort: @cohort,
        pref_name: "John Doe",
        user_attributes: {email: "test@example.com", name: "Test User"}
      ),
      Student.create!(
        absences: 2,
        cohort: @cohort,
        pref_name: "Jane Doe",
        user_attributes: {email: "test+1@example.com", name: "Test User"}
      )
    ])
  end

  it "renders a list of students" do
    # render
    # assert_select "tr>td", text: /cohort/i, count: 2
    # assert_select "tr>td", text: /absences/i, count: 2
  end
end
