class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  after_action :create_assessments, only: [:create]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /students
  def index
    @pagy, @students = pagy(Student.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @students
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new

    # Uncomment to authorize with Pundit
    # authorize @student
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    # Uncomment to authorize with Pundit
    # authorize @student

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
    # Uncomment to authorize with Pundit
    # authorize @student
  rescue ActiveRecord::RecordNotFound
    redirect_to students_path
  end

  def create_assessments
    (0..5).map do |i|
      @student.assessments.create({week: i + 1, comprehension: 0, status: 0, reviewer: "N/A", notes: "N/A"})
    end
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:cohort_id, :pref_name, :absences, assessments_attributes: [:id, :week, :comprehension, :status, :reviewer, :notes])

    # Uncomment to use Pundit permitted attributes
    # params.require(:student).permit(policy(@student).permitted_attributes)
  end
end
