class Talent < ApplicationRecord
    include ValidatesNamePresenceAndUniqueness
    include ValidatesEmailPresenceAndUniqueness

    has_many :course_authors, foreign_key: 'author_id'
    has_many :authored_courses, through: :course_authors, source: :course

    has_many :course_talent_enrollments, dependent: :destroy

    has_many :talent_learning_path_enrollments, dependent: :destroy

    before_destroy :assign_to_next_author, if: :is_author?

    private
    def is_author?
        self.course_authors.present?
    end

    def assign_to_next_author
        next_course_author =  CourseAuthor.next_author(id)
        next_author = Talent.find(next_course_author.author_id)

        #Delete course's authors if next author doesnt exist
        delete_course_authors unless next_author

        #Update Course's authors to next author
        course_authors.each do |course_author| 
            course_author.update(author: next_author)
        end
    end

    def delete_course_authors
        self.course_authors.destroy_all
    end

end
