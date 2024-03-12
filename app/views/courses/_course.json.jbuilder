json.extract! course, :id, :name, :created_at, :updated_at
json.authors course.authors, :id, :name, :email
json.url course_url(course, format: :json)
