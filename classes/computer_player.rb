require("./player.rb")

class ComputerPlayer < Player
    def initialize
        super("Computer")
    end

    def generate_code(COLORS, COLORS_HASH)
        code = []
        until code.length == 5
          code << COLORS.sample
          code.uniq!
        end 
        code.map! { |color| COLORS_HASH[color]}
        puts code.join
        code
    end

    def return_feedback(guess)
        guess.each_with_index do |color, index|
          if @code.include?(color)
            if @code[index] == color
              puts "#{color} - correct color and position"
            else
              puts "#{color} - correct color, wrong position"
            end
          else
            puts "#{color} - is not in the code"
          end
        end
      end
end