class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def generate_code
    puts "Enter your code:"
    code = gets.chomp
    code.split

    if code.uniq?.length == 5
      code
    else
      puts "Please enter 5 unique colors"
      generate_code
    end
end