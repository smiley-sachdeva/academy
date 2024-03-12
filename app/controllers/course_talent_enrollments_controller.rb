class CourseTalentEnrollmentsController < ApplicationController
    before_action :set_course_talent_enrollment, only: %i[ change_status ]
    before_action :set_talent, only: %i[ index ]

    def index
        @enrollments = @talent.course_talent_enrollments
    end

    def change_status
        respond_to do |format|
            if  @enrollment.update(enrollment_params)
              format.json { render @enrollment, status: :ok, location: @course, as: :enrollment }
            else
              format.json { render json: @enrollment.errors, status: :unprocessable_entity }
            end
          end       
    end

    private
    def set_talent
        @talent = Talent.find(params[:talent_id])
    end

    def enrollment_params
        params.require(:course_talent_enrollment).permit(:status)
    end

    def set_course_talent_enrollment
        @enrollment = CourseTalentEnrollment.find(params[:id])
    end
end