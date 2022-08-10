json.extract! student, :id, :absences, :user_id, :cohort_id, :created_at, :updated_at
json.url student_url(student, format: :json)
