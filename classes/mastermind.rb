require_relative 'player'
require_relative 'computer_player'
class Mastermind

  COLORS = %w(red orange yellow green blue purple)
  COLORS_HASH = { "red" => 1, "orange" => 2, "yellow" => 3, "green" => 4, "blue" => 5, "purple" => 6 }

  attr_accessor :player, :guesses, :turns, :gamemode, :code
  def initialize
    @player = Player.new
    @computer = ComputerPlayer.new
    @turns = 12
    @code = []
    @guesses = []
  end

  def select_gamemode
    puts "Enter 1 to be the codebreaker, or 2 to be the codemaker:"
    gamemode = gets.chomp
    if gamemode == "1"
      codebreaker_mode
    elsif gamemode == "2"
      codemaker_mode
    else
      puts "Invalid input. Please try again."
      select_gamemode
    end
  end

  def generate_code
    @code = []
    until @code.length == 5
      @code << COLORS.sample
      @code.uniq!
    end 
    @code.map! { |color| COLORS_HASH[color]}
    puts @code.join
  end

  def print_colors
    puts "Colors to choose from:"
    COLORS_HASH.each do |color, number|
      puts "#{number} = #{color}"
    end
  end

  def get_guess
    puts "Enter your guess:"
    guess = gets.chomp.chars.map(&:to_i)
    if guess.length != 5
      puts "Invalid input. Please try again."
      get_guess
    else
      @guesses << guess
    end
    guess
  end
  
  def codebreaker_mode 
    @code = @computer.generate_code(COLORS, COLORS_HASH)
    puts "The computer has generated a code. #{@code}"
    @turns.times do |turn|
      puts "Turn #{turn + 1}"
      guess = get_guess
      puts "guess = #{guess} code = #{@code}"
      if guess == @code.join
        puts "You win!"
        break
      else
        @computer.return_feedback(guess, @code)
      end
    end
    puts "You lose!" if @guesses.length == @turns
  end

  def codemaker_mode
  end
end

Mastermind.new.select_gamemode
