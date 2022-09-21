# == Schema Information
#
# Table name: assessments
#
#  id            :bigint           not null, primary key
#  comprehension :integer
#  notes         :text
#  reviewer      :string
#  status        :integer
#  week          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  student_id    :bigint           not null
#
# Indexes
#
#  index_assessments_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Assessment < ApplicationRecord
  belongs_to :student
  enum :status, {unassigned: 0, incomplete: 1, complete: 2, pending: 3}, prefix: true, scopes: false, default: :unassigned
  enum :comprehension, {unassigned: 0, incomplete: 1, complete: 2, novice: 3, advanced_beginner: 4, competent: 5}, suffix: true, default: :unassigned
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :assessments, partial: "assessments/index", locals: {assessment: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :assessments, target: dom_id(self, :index) }
end
