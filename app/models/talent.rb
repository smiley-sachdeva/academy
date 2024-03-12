class Talent < ApplicationRecord
    has_many :course_authors, foreign_key: 'author_id'
    has_many :authored_courses, through: :course_authors, source: :course

    has_many :course_talent_enrollments, dependent: :destroy

    has_many :talent_learning_path_enrollments, dependent: :destroy

end
