class LearningPath < ApplicationRecord
    has_many :course_learning_paths, class_name: 'CourseLearningPath', dependent: :destroy
    has_many :courses, through: :course_learning_paths

    has_many :talent_learning_path_enrollments, dependent: :destroy
end
