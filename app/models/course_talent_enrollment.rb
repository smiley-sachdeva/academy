class CourseTalentEnrollment < ApplicationRecord
    belongs_to :course
    belongs_to :talent

    belongs_to :talent_learning_path_enrollment

    validates :status, presence: true
    validates :status, inclusion: { in: %w(Not\ started In\ progress Completed), message: "%{value} is not a valid status" }

    after_update :assign_next_course, if: :completed?
    after_initialize :set_default_status, if: :new_record?

    private
    def set_default_status
        self.status ||=  'In progress'
    end
    
    def completed?
        saved_change_to_attribute?(:status) && status == 'Completed'
    end

    def assign_next_course
        current_learning_path = talent_learning_path_enrollment&.learning_path
        curent_sequence = current_learning_path.course_learning_paths.get_sequence(self.course_id)

        next_course = current_learning_path.course_learning_paths.next_course(curent_sequence)
        talent.course_talent_enrollments.create(
                course: next_course, 
                talent_learning_path_enrollment: talent_learning_path_enrollment
            ) if next_course
    
        talent_learning_path_enrollment.update(status: "Completed")
    end

end
