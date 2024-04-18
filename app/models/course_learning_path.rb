class CourseLearningPath < ApplicationRecord
    belongs_to :course
    belongs_to :learning_path

    # Validations
    validates :sequence, presence: true

    # Scopes

    # Scope to find sequenced course
    scope :have_sequence, ->(sequence) { find_by(sequence: sequence) }

    # Scope to find the sequence of course in a learning path
    scope :get_sequence, ->(course_id) { where(course_id: course_id).last&.sequence }

    # Scope to find next sequential course in learning path
    scope :next_course, ->(sequence){ where(sequence: sequence + 1).last&.course }

end
