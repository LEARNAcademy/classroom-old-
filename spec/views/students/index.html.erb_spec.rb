require "rails_helper"

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:cohort, Cohort.create!(
      id: 1
    ))
    assign(:students, [
      Student.create!(
        cohort: nil,
        absences: 2,
        cohort_id: 1,
        pref_name: "John Doe"
      ),
      Student.create!(
        cohort: nil,
        absences: 2,
        cohort_id: 1,
        pref_name: "Jane Doe"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
