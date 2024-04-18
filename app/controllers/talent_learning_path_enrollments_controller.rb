class TalentLearningPathEnrollmentsController < ApplicationController
    before_action :set_talent, only: %i[ index create ]

    def index
        @enrollments = @talent.talent_learning_path_enrollments
    end

    def create
    @enrollment = @talent.talent_learning_path_enrollments.build(talent_learning_path_params)

    respond_to do |format|
      if @enrollment.save
        format.json { render json: { 
                              enrollment: @enrollment,
                              errors: @enrollment.errors
                            }, 
                            status: :ok, 
                            as: :enrollment 
                    }
      else
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
    end

    private
    def set_talent
        @talent = Talent.find(params[:talent_id])
    end 
    
    def talent_learning_path_params
        params.require(:talent_learning_path_enrollment).permit(:learning_path_id, :status)
    end 
end