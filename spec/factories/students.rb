FactoryBot.define do
  factory :student do
    absences { 1.5 }
    user { nil }
    cohort { nil }
  end
end
