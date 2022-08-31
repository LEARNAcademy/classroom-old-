require "rails_helper"

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @cohort = assign(:cohort, Cohort.create(
      id: 1,
      cohort_name: "Cohort Name",
      year: 1990
    ))
    @student = assign(:student, Student.create!(
      cohort: nil,
      absences: 1,
      cohort_id: 1,
      pref_name: "John Doe"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do
      assert_select "input[name=?]", "student[pref_name]"
      assert_select "select[name=?]", "student[cohort_id]"
      assert_select "input[name=?]", "student[absences]"
    end
  end
end
