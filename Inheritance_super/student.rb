require './user.rb'

class Student < User
  def log_in
    super
    puts "this is coming from super #{@logged_in}"
    @in_class = true
  end
end