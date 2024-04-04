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
        current_learning_path = talent.talent_learning_path_enrollments.where(status: "In progress").last&.learning_path
        curent_sequence = current_learning_path.course_learning_paths.where(course_id: self.course_id).last.sequence

        next_course = current_learning_path.course_learning_paths.where(sequence: curent_sequence + 1).last.course_id
        talent.course_talent_enrollments.create!(course_id: next_course, status: "In progress", talent_learning_path_enrollment_id: talent_learning_path_enrollment.id)
    end

end
