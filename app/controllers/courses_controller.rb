class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show update destroy add_authors ]

  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1.json
  def show
  end

  # POST /courses.json
  def create
    @course = Course.new(course_params)
    if @course.save
      respond_to do |format|
        format.json { render :show, status: :created, location: @course }
      end
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Author not found' }, status: :not_found
  end

  # PATCH/PUT /courses/1.json
  def update
    if @course.update(course_params)
      
      byebug
      # Delete existing CourseAuthors that are not in the updated author_ids array
      @course.course_authors.where.not(author_id: course_params[:author_ids]).destroy_all

      respond_to do |format|
        format.json { render :show, status: :ok, location: @course }
      end
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Author not found' }, status: :not_found
  end

  # DELETE /courses/1.json
  def destroy
    @course.destroy
    head :no_content
  end

  private
    def set_course
      @course = Course.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Course not found' }, status: :not_found
    end  

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, author_ids: [])
    end
end
