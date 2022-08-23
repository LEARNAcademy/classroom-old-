require "rails_helper"

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      cohort: nil,
      absences: 1
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do
      assert_select "input[name=?[", "student[pref_name]"
      assert_select "input[name=?]", "student[cohort_id]"
      assert_select "input[name=?]", "student[absences]"
    end
  end
end
