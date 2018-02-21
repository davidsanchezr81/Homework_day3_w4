require_relative('models/student.rb')
require('pry-byebug')


Student.delete_all()
student1 = Student.new({ 'first_name' => 'Pedro', 'second_name' => 'Galvez', 'house' => 'Quinta5', 'age' => 24})
student1.save()

student2 = Student.new({ 'first_name' => 'John', 'second_name' => 'Schwartz', 'house' => 'Quinta10', 'age' => 58})
student2.save()

binding.pry
nil
