class CourseAuthor < ApplicationRecord
    belongs_to :course
    belongs_to :author, class_name: 'Talent', foreign_key: 'author_id'
end