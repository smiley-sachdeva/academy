class CourseTalentEnrollment < ApplicationRecord
   belongs_to :course
    belongs_to :talent

    belongs_to :talent_learning_path_enrollment

    validates :status, presence: true
    validates :status, inclusion: { in: %w(Not\ started In\ progress Completed), message: "%{value} is not a valid status" }

    after_update :assign_next_course, if: :completed?

    private
    def completed?
        saved_change_to_attribute?(:status) && status == 'Completed'
    end

    def assign_next_course
        #Todo after learning path association
    end

end
