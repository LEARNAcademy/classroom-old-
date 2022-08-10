require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        absences: 2.5,
        user: nil,
        cohort: nil
      ),
      Student.create!(
        absences: 2.5,
        user: nil,
        cohort: nil
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
