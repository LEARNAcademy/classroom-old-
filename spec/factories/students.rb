# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  absences   :integer
#  pref_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cohort_id  :bigint           not null
#
# Indexes
#
#  index_students_on_cohort_id  (cohort_id)
#
# Foreign Keys
#
#  fk_rails_...  (cohort_id => cohorts.id)
#
FactoryBot.define do
  factory :student do
    cohort { nil }
    absences { 1 }
  end
end
