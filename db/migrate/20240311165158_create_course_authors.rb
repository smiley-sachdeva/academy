class CreateCourseAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :course_authors do |t|
      t.belongs_to :author, foreign_key: { to_table: :talents }
      t.belongs_to :course, foreign_key: true


      t.timestamps
    end
  end
end
