require_relative 'player'

class ComputerPlayer < Player
    def initialize
        @name = "Computer"
    end

    def generate_code(colors, colors_hash)
        code = []
        until code.length == 5
          code << colors.sample
          code.uniq!
        end 
        code.map! { |color| colors_hash[color]}
        puts code.join
        code
    end

    def return_feedback(guess, code)
        guess.each_with_index do |color, index|
          if code.include?(color)
            if code[index] == color
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