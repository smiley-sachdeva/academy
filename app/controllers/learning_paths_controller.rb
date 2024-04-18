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
    build_course_associations if params[:learning_path][:courses]

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
      build_course_associations if params[:learning_path][:courses]
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
    head :no_content
  end

  def align_courses
    build_course_associations
    @learning_path.save
    
    render json: @learning_path.courses, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_path
      @learning_path = LearningPath.find(params[:id])
    end

    def build_course_associations
      course_params.each do |course_param|
        @learning_path.course_learning_paths.build(
            course_id: course_param[:id], 
            sequence: course_param[:sequence]
          )
      end      
    end

    def course_params
      params.require(:learning_path).require(:courses).map { |course| course.permit(:id, :sequence) }
    end

    # Only allow a list of trusted parameters through.
    def learning_path_params
      params.require(:learning_path).permit(:name)
    end
end
