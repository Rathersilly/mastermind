#classes
# game
# board
# player
class Game

  def initialize(code_length = 4, code_base = 6)
    #@code_maker = code_maker
    #@code_breaker = code_breaker
    
    @code_length = code_length
    @code_base = code_base

    board = Board.new(pegs, code_length)
  end

  def start
    #which player is the codemaker and which is the codebreaker
    #by default player1 makes and player2 breaks

    puts "Codemaker please make ur code"

    #
    @code = gets.chomp
    code.split!

    puts "OK now other guy guess code"
    @guess = gets.chomp
    @guesses.push  @guess.split

    #compare code and guess and return key pegs

  end

  private

  def check_guess
    @return_hash = {all_correct: 0, position_only: 0}
    @code.split.each do  |i|
      if @guess[i] == code[i]
        @return_hash[all_correct] += 1
      elsif @code.include?(guess[i])
        #something else
      end
    end


    #return hash of 
  end

  def draw_board
    guesses.each 
  end


end





class Board
  

  def initialize(pegs, code_length)
    @pegs = pegs
    @code_length = code_length

  end

  def show
  end



end

