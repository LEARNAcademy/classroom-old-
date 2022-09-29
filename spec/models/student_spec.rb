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
#  user_id    :bigint
#
# Indexes
#
#  index_students_on_cohort_id  (cohort_id)
#  index_students_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cohort_id => cohorts.id)
#
require "rails_helper"

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
