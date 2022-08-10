require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      absences: 1.5,
      user: nil,
      cohort: nil
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input[name=?]", "student[absences]"

      assert_select "input[name=?]", "student[user_id]"

      assert_select "input[name=?]", "student[cohort_id]"
    end
  end
end
