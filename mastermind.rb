#classes
# game
# board
# player

#store code and guesses as arrays
class Game


  def initialize(code_length = 4, code_base = 6)
    #@code_maker = code_maker
    #@code_breaker = code_breaker
    
    @code_length = code_length
    @code_base = code_base     #number of possible elements in code
    @guesses = []

    #board = Board.new(code_length, code_base)
  end

  def start
    #which player is the codemaker and which is the codebreaker
    #by default player1 makes and player2 breaks

    puts "Codemaker please make ur code"

    #
    input = gets.chomp
    @code = input.split("")

    #while code not guessed and tries not exceeded
    puts "OK now other guy guess code"
    puts "Format: 'ABCD' if guess ABCD"
    input = gets.chomp
    guess = input.split("")
    @guesses.push(guess)

    guess_result = check_guess(guess)

    #compare code and guess and return key pegs
    if guess_result[:all_correct] = code_length
      #game over with win
    end

    #show 
  end

  private

  def check_guess(guess)
    code_temp = @code
    # puts "code_temp = #{code_temp}"
    # puts "guess = #{guess}"
    
    return_hash = {all_correct: 0, position_only: 0}
    
    correct = 0
    @code.length.times do |i|
      # puts "i = #{i}"
      # puts "code_temp_length = #{code_temp.length}"


      # p guess[i]
      # p code_temp[i]
      # p return_hash[:all_correct]
      if guess[i-correct] == code_temp[i-correct]
        return_hash[:all_correct] += 1
        code_temp.delete_at(i-correct)
        guess.delete_at(i-correct)
        correct += 1
      end
      
      puts "code_temp = #{code_temp}"
      puts "guess = #{guess}"
      p return_hash
      puts
    end
    code_temp.each_with_index do  |x, i|
      if guess.include?(x)
        guess.delete(x)
        code_temp[i] = " "
        puts "match found"
        
        return_hash[:position_only] += 1


      end
    end

    
    puts return_hash
    return return_hash
  end

  def draw_board
    @guesses.each do |x|
      puts x
    end
  end
end



# class Board
  

#   def initialize(pegs, code_length)
#     @pegs = pegs
#     @code_length = code_length

#   end

#   def show
#   end

# end

game = Game.new
game.start