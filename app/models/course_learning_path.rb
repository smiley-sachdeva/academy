class CourseLearningPath < ApplicationRecord
    belongs_to :course
    belongs_to :learning_path

    # Validations
    validates :sequence, presence: true

    #scopes
    # Scope to find sequenced course
    scope :have_sequence, ->(sequence) { find_by(sequence: sequence) }
end
