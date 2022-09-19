class CsvStudentsImport
  require 'csv'

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true)
    csv.each do |row|
      student_hash = {}
      student_hash[:pref_name] = row["Preferred Name"]
      student_hash[:absences] = 0
      student_hash[:cohort_id] = 1
      @student = Student.create(student_hash)
    end
  end
end