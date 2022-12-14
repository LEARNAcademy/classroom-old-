# == Schema Information
#
# Table name: cohorts
#
#  id          :bigint           not null, primary key
#  cohort_name :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cohort < ApplicationRecord
  has_many :students
  validates :year, numericality: true
  validates :cohort_name, presence: true
  validates :cohort_name, length: {maximum: 15}
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :cohorts, partial: "cohorts/index", locals: {cohort: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :cohorts, target: dom_id(self, :index) }
end
