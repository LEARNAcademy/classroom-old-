require "rails_helper"

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @cohort = assign(:cohort, Cohort.create(
      cohort_name: "Cohort Name",
      year: 1990
    ))
    @student = assign(:student, Student.create!(
      cohort: @cohort,
      absences: 1,
      pref_name: "John Doe",
      user_attributes: {email: "test@example.com", name: "Test User"}
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
