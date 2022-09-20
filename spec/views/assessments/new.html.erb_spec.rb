require "rails_helper"

RSpec.describe "assessments/new", type: :view do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }
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
    assign(:assessment, Assessment.new(
      student: nil,
      week: 1,
      status: 1,
      comprehension: 1,
      reviewer: "MyString",
      notes: "MyText"
    ))
    Assessment.create! valid_attributes
  end

  it "renders new assessment form" do
    render

    assert_select "form[action=?][method=?]", assessments_path, "post" do
      # These two are probably uneeded because they are created upon student creation with default values and will not be available for edit
      # assert_select "input[name=?]", "assessment[student_id]"
      # assert_select "input[name=?]", "assessment[week]"

      assert_select "input[name=?]", "assessment[status]"

      assert_select "input[name=?]", "assessment[comprehension]"

      assert_select "input[name=?]", "assessment[reviewer]"

      assert_select "textarea[name=?]", "assessment[notes]"
    end
  end
end
