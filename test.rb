class Student

	attr_accessor :name, :grade, :semester

	def initialize(name, grade, semester)
		@name = name
		@grade = grade
		@semester = semester
	end

end

class School

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking

	def initialize(name, location, ranking)
		@name = name
		@location = location
		@ranking = ranking
		@students = []
		@instructors = []
		# Students (and instructors) intentionally not set with parameters so we can fill them using the add_student method and possibly later an add_instructor.
		SCHOOLS.push(self)
	end

	def set_ranking(value)
		@ranking = value
	end

	# b. Refactor your School instance methods to treat Students as an array of objects instead of an array of hashes.
	def add_student(name, grade, semester)
		students.push(Student.new(name, grade, semester))
	end

	def remove_student(name)
		students.each do |student|
			if student.name == name
				students.delete(student)
			end
		end
	end

	# c. Create a method in the School class that finds a student by name and returns the correct Student object.
	def find_student(name)
		students.each do |student|
			if student.name == name
				puts student
			end
		end
	end

	SCHOOLS = []

	def School.reset
		SCHOOLS.clear
	end

end

newschool = School.new("Princeton", "Princeton, NJ", "1")
newschool.add_student("Nikki", "A", "Fall")
newschool.find_student("Nikki")
