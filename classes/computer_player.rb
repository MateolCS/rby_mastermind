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
end