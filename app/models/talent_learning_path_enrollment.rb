class TalentLearningPathEnrollment < ApplicationRecord
    belongs_to :learning_path
    belongs_to :talent

    has_many :course_talent_enrollments, dependent: :destroy
 
    validates :status, presence: true
    validates :status, inclusion: { in: %w(In\ progress Completed), message: "%{value} is not a valid status" }

    after_create :enroll_courses

    private
    #After enrolliing to any learning path, first sequenced course
    #must be assigned to talent automatically with status - In progress
    
    def enroll_courses
        course  = learning_path.course_learning_paths.where(sequence: 1).first.course
        course_talent_enrollments.create(course_id: course.id, talent_id: talent.id, status: 'In progress')
    end
end
 