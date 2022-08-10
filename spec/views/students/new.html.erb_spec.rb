require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      absences: 1.5,
      user: nil,
      cohort: nil
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[absences]"

      assert_select "input[name=?]", "student[user_id]"

      assert_select "input[name=?]", "student[cohort_id]"
    end
  end
end
