class LearningPathsController < ApplicationController
  before_action :set_learning_path, only: %i[ show update destroy align_courses ]

  # GET /learning_paths or /learning_paths.json
  def index
    @learning_paths = LearningPath.all
  end

  # GET /learning_paths/1 or /learning_paths/1.json
  def show
  end

  # POST /learning_paths or /learning_paths.json
  def create
    @learning_path = LearningPath.new(learning_path_params)

    respond_to do |format|
      if @learning_path.save
        format.json { render :show, status: :created, location: @learning_path }
      else
        format.json { render json: @learning_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_paths/1 or /learning_paths/1.json
  def update
    respond_to do |format|
      if @learning_path.update(learning_path_params)
        format.json { render :show, status: :ok, location: @learning_path }
      else
        format.json { render json: @learning_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_paths/1 or /learning_paths/1.json
  def destroy
    @learning_path.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def align_courses
    learning_path_params[:courses].each do |course|
      @learning_path.course_learning_paths.build(course_id: course[:id], sequence: course[:sequence])
    end
    @learning_path.save
    
    render json: @learning_path.courses, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_path
      @learning_path = LearningPath.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def learning_path_params
      params.require(:learning_path).permit(:name, courses: [:id, :sequence])
    end
end
