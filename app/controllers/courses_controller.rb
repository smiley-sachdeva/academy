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
    enroll_authors

    respond_to do |format|
      if @course.save
        format.json { render :show, status: :created, location: @course }
      else
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.json { render :show, status: :ok, location: @course }
      else
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  #TODO exception handling -- if authors already enrolled, if authors doesnot exist
  def add_authors
    enroll_authors
    render json: @course.authors, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #TODO exception for course not found
    def set_course
      @course = Course.find(params[:id])
    end

    #Enroll author to a course
    def enroll_authors
      authors = Talent.where(id: course_params[:author_ids])
      @course.authors = authors
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, author_ids: [])
    end
end
