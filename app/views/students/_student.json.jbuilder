json.extract! student, :id, :cohort_id, :absences, :created_at, :updated_at
json.url student_url(student, format: :json)
