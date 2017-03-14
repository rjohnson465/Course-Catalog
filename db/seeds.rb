# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'byebug'

File.open('./lib/course.json', 'r') do |file|
  file.each do |line|
    json = JSON.parse(line)
    json.each do |course|
      Course.create(name: course["name"], code: course["code"], given_id: course["id"], subjects: course["subjects"], description: course["description"])
    end
  end
end

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
