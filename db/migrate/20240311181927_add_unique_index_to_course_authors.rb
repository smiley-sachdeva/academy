class AddUniqueIndexToCourseAuthors < ActiveRecord::Migration[6.0]
  def change
    add_index :course_authors, [:course_id, :author_id], unique: true
  end
end
