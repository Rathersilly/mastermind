#classes
# game
# board
# player

#store code and guesses as arrays


class Game
  MAX_TRIES = 4

  def initialize(code_length = 4, code_base = 6)
    #@code_maker = code_maker
    #@code_breaker = code_breaker
    
    @code_length = code_length
    @code_base = code_base     #number of possible elements in code
    @guesses = []
    @returns = []
    @tries = 0

    #board = Board.new(code_length, code_base)
  end

  def start
    #which player is the codemaker and which is the codebreaker
    #by default player1 makes and player2 breaks

    puts "Codemaker please make ur code"

    #
    input = gets.chomp
    @code = input.split("")     #code is an array of strings

    #while code not guessed and tries not exceeded
    while @tries < MAX_TRIES
      puts "OK now other guy guess code"
      puts "Format: 'ABCD' if guess ABCD"
      input = gets.chomp
      guess = input.split("")     #guess is an array
      #puts guess
      @guesses.push(guess)        #@guesses is an array of arrays of strings
      
      #puts "@guesses: #{@guesses}"
      @tries += 1

      guess_result = check_guess(guess)
      @returns.push(guess_result)

      draw_board

      
      if guess_result[:all_correct] == @code_length
        puts "WIN"
        #game over with win
      end
    end


    #show 
  end

  private

  def check_guess(guess)
    code_temp = @code.dup
    
    guess_temp = guess.dup
    
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
      if guess_temp[i-correct] == code_temp[i-correct]
        return_hash[:all_correct] += 1
        code_temp.delete_at(i-correct)
        guess_temp.delete_at(i-correct)
        correct += 1
      end
      
      # puts "code_temp = #{code_temp}"
      # puts "guess_temp = #{guess_temp}"
      # p return_hash
      # puts
    end

    code_temp.each_with_index do  |x, i|
      if guess_temp.include?(x)
        # puts "\n\n guesses"
        # p @guesses134
        # puts "\n\n"
        guess_temp.delete(x)
        code_temp[i] = " "
        # puts "match found"
        
        return_hash[:position_only] += 1


      end
    end

    
    #puts return_hash
    return return_hash
  end

  def draw_board
    puts "X" * @code_length + "\tall_correct\tposition_only"
    
    @guesses.each_with_index do |x, i|
      print x.join + "\t#{@returns[i][:all_correct]}\t\t#{@returns[i][:position_only]}"
      puts
    end
    puts
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