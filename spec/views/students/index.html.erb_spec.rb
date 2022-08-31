require "rails_helper"

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:cohort, Cohort.create!(
      id: 1,
      cohort_name: "Charlie",
      year: 1990
    ))
    assign(:students, [
      Student.create!(
        absences: 2,
        cohort_id: 1,
        pref_name: "John Doe"
      ),
      Student.create!(
        absences: 2,
        cohort_id: 1,
        pref_name: "Jane Doe"
      )
    ])
  end

  it "renders a list of students" do
    # render
    # assert_select "tr>td", text: /cohort/i, count: 2
    # assert_select "tr>td", text: /absences/i, count: 2
  end
end
