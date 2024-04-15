class CourseAuthor < ApplicationRecord
    belongs_to :course
    belongs_to :author, class_name: 'Talent', foreign_key: 'author_id'

    #Scope to find next author on basis of current authoor
    scope :next_author, ->(id) { where.not(author_id: id).order(Arel.sql('RANDOM()')).limit(1).first }

end