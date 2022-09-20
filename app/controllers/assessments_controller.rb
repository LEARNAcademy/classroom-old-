class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]
  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /assessments
  def index
    @pagy, @assessments = pagy(Assessment.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @assessments
  end

  # GET /assessments/1 or /assessments/1.json
  def show
  end

  # GET /assessments/new
  def new
    @assessment = Assessment.new

    # Uncomment to authorize with Pundit
    # authorize @assessment
  end

  # GET /assessments/1/edit
  def edit
  end

  # POST /assessments or /assessments.json
  def create
    @assessment = Assessment.new(assessment_params)

    # Uncomment to authorize with Pundit
    # authorize @assessment

    respond_to do |format|
      if @assessment.save
        format.html { redirect_to @assessment, notice: "Assessment was successfully created." }
        format.json { render :show, status: :created, location: @assessment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessments/1 or /assessments/1.json
  def update
    respond_to do |format|
      if @assessment.update(assessment_params)
        format.html { redirect_to @assessment, notice: "Assessment was successfully updated." }
        format.json { render :show, status: :ok, location: @assessment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessments/1 or /assessments/1.json
  def destroy
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to assessments_url, notice: "Assessment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assessment
    @assessment = Assessment.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @assessment
  rescue ActiveRecord::RecordNotFound
    redirect_to assessments_path
  end

  # Only allow a list of trusted parameters through.
  def assessment_params
    params.require(:assessment).permit(:student_id, :week, :status, :comprehension, :reviewer, :notes)

    # Uncomment to use Pundit permitted attributes
    # params.require(:assessment).permit(policy(@assessment).permitted_attributes)
  end
end
