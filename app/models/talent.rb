class Talent < ApplicationRecord
    has_many :course_authors, foreign_key: 'author_id'
    has_many :authored_courses, through: :course_authors, source: :course

    has_many :course_talent_enrollments, dependent: :destroy

    has_many :talent_learning_path_enrollments, dependent: :destroy

    before_destroy :assign_to_next_author, if: :is_author?

    #TODO Email validation unique

    private
    def is_author?
        self.course_authors.present?
    end

    def assign_to_next_author
        rand_author =  CourseAuthor.where.not(author_id: self.id).order("RANDOM()").limit(1).first
        delete_course_authors unless rand_author
        course_authors.each do |record| 
            record.author = Talent.find(rand_author.author_id)
            record.save 
        end
    end

    def delete_course_authors
        self.course_authors.delete_all
    end

end
