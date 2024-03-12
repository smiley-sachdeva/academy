class CourseLearningPath < ApplicationRecord
    belongs_to :course
    belongs_to :learning_path

    validates :sequence, presence: true
end
