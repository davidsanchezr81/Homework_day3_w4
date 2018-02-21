require_relative('../db/sql_runner')



class Student

  attr_reader :first_name, :second_name, :house, :age

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def full_name()
    return "#{@first_name} #{@second_name}"
  end

  def house()
    return "#{@house}"
  end
  #
  def status()
    return "FULLY ENROLLED"
  end
  def save()
    sql = "INSERT INTO students
    (
      first_name,
      second_name,
      house,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @second_name, @house, @age]
    student = SqlRunner.run(sql, values).first
    @id = student['id'].to_i
  end

  def Student.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def Student.all
    sql = "SELECT * FROM students"
    values = []
    students = SqlRunner.run(sql, values)
    result = students.map { |student| Student.new( student) } # esto se cancelan porque usamos el metodo de Location.map_items
    return result
  end

  def Student.find( id )
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run( sql, values )
    result = Student.new( student.first )
    return result
  end

end
