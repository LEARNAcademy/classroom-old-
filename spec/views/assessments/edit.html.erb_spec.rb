require 'rails_helper'

RSpec.describe "assessments/edit", type: :view do
  before(:each) do
    @assessment = assign(:assessment, Assessment.create!(
      student: nil,
      week: 1,
      status: 1,
      comprehension: 1,
      reviewer: "MyString",
      notes: "MyText"
    ))
  end

  it "renders the edit assessment form" do
    render

    assert_select "form[action=?][method=?]", assessment_path(@assessment), "post" do

      assert_select "input[name=?]", "assessment[student_id]"

      assert_select "input[name=?]", "assessment[week]"

      assert_select "input[name=?]", "assessment[status]"

      assert_select "input[name=?]", "assessment[comprehension]"

      assert_select "input[name=?]", "assessment[reviewer]"

      assert_select "textarea[name=?]", "assessment[notes]"
    end
  end
end
