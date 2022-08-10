class Student < ApplicationRecord
  belongs_to :user
  belongs_to :cohort

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :students, partial: "students/index", locals: { student: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :students, target: dom_id(self, :index) }
end
