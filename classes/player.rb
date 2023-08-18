class Player
  attr_accessor :name
  def initialize()
  end

  def generate_code
    puts "Enter your code:"
    code = gets.chomp.chars.map(&:to_i)
    puts "code is #{code}"
    if code.uniq.length == 4
      if code.any? { |color| color > 6 || color < 1 }
        puts "Please enter a number between 1 and 6"
        generate_code
      else
        code
      end
    else
      puts "Please enter 4 unique colors"
      generate_code
    end
  end

    def return_feedback(code, guess)
      result = []
      guess.each_with_index do |color, index|
        if code.include?(color)
          if code[index] == color
            result[index] = "CP"
          else
            result[index] = "CC"
          end
        else
          result[index] = "X"
        end
      end
      result
    end
end