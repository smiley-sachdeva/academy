class TalentLearningPathEnrollment < ApplicationRecord
    belongs_to :learning_path
    belongs_to :talent

    has_many :course_talent_enrollments, dependent: :destroy
 
    validates :status, presence: true
    validates :status, inclusion: { in: %w(In\ progress Completed), message: "%{value} is not a valid status" }

    after_initialize :set_default_status, if: :new_record?
    after_create :enroll_in_first_course

    private

    def set_default_status
        self.status ||=  'In progress'
    end

    # After enrolliing to any learning path, first sequenced course
    ## must be assigned to talent automatically with status - In progress    
    def enroll_in_first_course
        course  = learning_path.course_learning_paths.have_sequence(1).first&.course

        if course
            course_talent_enrollments.create(course: course, talent: talent)
        else
            errors.add(:base, "First sequenced course not found for learning path")
        end
    end
end
 