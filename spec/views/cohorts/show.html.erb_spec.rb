require "rails_helper"

RSpec.describe "cohorts/show", type: :view do
  before(:each) do
    @cohort = assign(:cohort, Cohort.create!(
      cohort_name: "Cohort Name",
      year: 1990
    ))
  end

  it "renders attributes" do
    render @cohort
    expect(rendered).to match(/Cohort Name/)
  end
end
