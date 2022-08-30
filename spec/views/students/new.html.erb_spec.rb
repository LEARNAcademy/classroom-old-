require "rails_helper"

RSpec.describe "students/new", type: :view do
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
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do
      assert_select "input[name=?]", "student[pref_name]"
      assert_select "select[name=?]", "student[cohort_id]"
      assert_select "input[name=?]", "student[absences]"
    end
  end
end
