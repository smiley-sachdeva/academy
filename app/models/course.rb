class Course < ApplicationRecord
  include ValidatesNamePresenceAndUniqueness
  include ValidatesAuthorPresence

  #Associations
  has_many :course_authors, dependent: :destroy
  has_many :authors, through: :course_authors

  has_many :learning_paths, through: :courses_learning_paths, source: :learning_path
  has_many :course_learning_paths, class_name: 'CourseLearningPath', dependent: :destroy

  has_many :course_talent_enrollments, dependent: :destroy
end
