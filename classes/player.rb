class Player
  attr_accessor :name
  def initialize()
    puts "Enter your name:"
    @name = gets.chomp
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

    def return_feedback(guess)
      result = []
      guess.each_with_index do |color, index|
        if @code.include?(color)
          if @code[index] == color
            result[index] = "CP"
          else
            result[index] = "CC"
          end
        else
          result[index] = "X"
        end
      end
    end
end