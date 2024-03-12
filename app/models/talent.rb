class Talent < ApplicationRecord
    has_many :course_authors, foreign_key: 'author_id'
    has_many :authored_courses, through: :course_authors, source: :course
end
