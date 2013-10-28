# 1. Arrays

array = ["Blake","Ashley","Jeff"]

array.push("Nikki")

array.each { |name| puts name }

array[1]

array.index("Jeff")


#2. Hashes

instructor = {:name=>"Ashley", :age=>27 }

instructor[:location] = "NYC"

instructor.each { |key,value| puts "#{key}, #{value}" }

instructor[:name]

instructor.key(27)


#3. Nested Structures

school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

school[:founded_in] = "2013"

students = school[:students]
instructors = school[:instructors]

students.push(
	{ :name => "Kate", :grade => "A" }
	)

students.slice!(1)

students.each { |hash| hash[:semester] = "Summer" }

instructors[1][:subject] = "being almost better than blake"

students[1][:grade] = "F"

students[0][:name]

instructors[2][:subject]

school.each do |key, value|
	if value.is_a? String
		puts value
	else
		value.each do |array|
			array.each do |key, value|
				puts value
			end
		end
	end
end


#4. Methods

def return_grade(list, name)
	list.each do |hash|
		if hash.value?(name) == true
			return hash[:grade]
			puts hash[:grade]
		end
	end
end

return_grade(school[:students], "Frank")

def update_subject(list, instructor, subject)
	list.each do |hash|
		if hash.value?(instructor) == true
			hash[:subject] = subject
		end
	end
end

update_subject(school[:instructors], "Blake", "being terrible")

def add_new_student(list, name)
	list.push(
		{ 
			:name => name,
			:grade => "none",
			:semester => "Summer"
		}
		)
end

add_new_student(school[:students], "Nikki")

def ranking(list, key, value)
	list[key] = value
end

ranking(school, :ranking, "1")


#5. Object Orientation

SCHOOLS = []

class School

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking

	def initialize(name, location, ranking, students, instructors)

		@name = name
		@location = location
		@ranking = ranking
		@students = []
		@instructors = []
		@students.push(students)
		@instructors.push(instructors)

		SCHOOLS.push(self)

	end

	def ranking(rank)
		ranking = rank
	end

	def add_student(name, grade, semester)
		students.push (
			{	:name => name,
				:grade => grade,
				:semester => semester }
			)		
	end

	def remove_student(name)
		students.each do |hash|
			if hash.value?(name) == true
				students.delete(hash)
			end
		end
	end

	def reset
		SCHOOLS.clear
	end
end

school2 = School.new("Flatiron", "location", "ranking", {:name => "Katie"}, {:name => "Blake"})
school3 = School.new("GA", "Midtown", "2", {:name => "Andrew"}, {:name => "Jonathan"})
school2.add_student("Nikki", "A", "Summer")
school2.add_student("Tara", "A", "Winter")
school2.remove_student("Tara")


#6. Classes

class School < Hash

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking

	def initialize(name, location, ranking, students, instructors)

		@name = name
		@location = location
		@ranking = ranking
		@students = []
		@instructors = []
		@students.push(students)
		@instructors.push(instructors)

	end

	class Student

		attr_reader :name

		def initialize(name, grade, semester)
			@name = name
			@grade = grade
			@semester = semester
		end

	end

	def find_student(student_name)

		students.each do |x|
			if @name == student_name
				return x
				puts x
			end
		end

	end

end


student1 = School::Student.new("Anna", "A", "Fall")
school3 = School.new("School3", "location", "ranking", nil, nil)
school3.students.push(student1)
puts school3.students
school3.find_student("Anna")


# a. Create a Student class.

# b. Refactor your School instance methods to treat Students 
# as an array of objects instead of an array of hashes.

# c. Create a method in the School class that finds a student by name 
# and returns the correct Student object.
