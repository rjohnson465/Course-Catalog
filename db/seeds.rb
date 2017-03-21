# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

File.open('./lib/instructor.json', 'r') do |file|
  file.each do |line|
    json = JSON.parse(line)
    json.each do |instructor|
      Instructor.create(first: instructor["first"], middle: instructor["middle"], last: instructor["last"], email: instructor["email"], given_id: instructor["id"])
    end
  end
end

File.open('./lib/subject.json', 'r') do |file|
  file.each do |line|
    json = JSON.parse(line)
    json.each do |subject|
      Subject.create(name: subject["name"], abbreviation: subject["abbreviation"], given_id: subject["id"])
    end
  end
end

File.open('./lib/course.json', 'r') do |file|
  file.each do |line|
    json = JSON.parse(line)
    json.each do |course|
      # get all subjects associated with course
      c = course["subjects"]
      subject_array = Array.new
      c.each do |segsubpair|
        if (segsubpair && segsubpair["id"] && Subject.find_by(given_id: segsubpair["id"]))
          subject_name = Subject.find_by(given_id: segsubpair["id"]).name
          subject_array.push(subject_name) unless subject_name == nil
        end
      end
      Course.create(name: course["name"], code: course["code"], given_id: course["id"], subjects: subject_array, description: course["description"])
    end
  end
end
