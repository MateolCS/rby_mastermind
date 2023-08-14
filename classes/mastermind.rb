require_relative 'player'
require_relative 'computer_player'
class Mastermind

  COLORS = %w(red orange yellow green blue purple)
  COLORS_HASH = { "red" => 1, "orange" => 2, "yellow" => 3, "green" => 4, "blue" => 5, "purple" => 6 }

  attr_accessor :player, :guesses, :turns, :gamemode, :code
  def initialize
    puts "Enter your name:"
    name = gets.chomp
    @player = Player.new(name)
    @computer = ComputerPlayer.new
    @turns = 12
    @code = []
    @guesses = []
  end

  def select_gamemode
    puts "Enter 1 to be the codebreaker, or 2 to be the codemaker:"
    gamemode = gets.chomp
    if gamemode == "1"
      
    elsif gamemode == "2"
      
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
  
  def codebreaker_mode 

  end

  def codemaker_mode
  end
end

Mastermind.new.generate_code
