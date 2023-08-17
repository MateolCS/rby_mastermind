require_relative 'player'

class ComputerPlayer < Player
    attr_accessor :name, :guesses, :guess_permutations

    def initialize
        @name = "Computer"
        @guesses = []
        @guess_permutations = [1,2,3,4,5,6].repeated_permutation(4).to_a
    end

    def generate_code(colors, colors_hash)
        code = []
        until code.length == 4
          code << colors.sample
          code.uniq!
        end 
        code.map! { |color| colors_hash[color]}
        puts code.join
        code
    end

    def crack_code
        if @guess_permutations.include?([1, 1, 2, 2])
          return [1, 1, 2, 2] 
        else
          return @guess_permutations[0]
        end
    end

    def remove_impossible_guesses(guess, feedback)
        guess.each_with_index do |color, index|
          if feedback[index] == "X"
            @guess_permutations.delete_if { |guess| guess[index] == color }
          elsif feedback[index] == "CC"
            @guess_permutations.delete_if { |guess| !guess.include?(color) && guess[index] == color }
          else
            @guess_permutations.delete_if { |guess| guess[index] != color }
          end
        end
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