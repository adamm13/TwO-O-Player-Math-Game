require "./question"
require "./players"

class Game

  def initialize #set the game up by initializing two players
    @Player1 = Players.new("Player 1")
    @Player2 = Players.new("Player 2")
    @current_player = @Player1 #initialize the player to go first 
  end

  def current_player #Check to see who the current player is
    @current_player == @Player1 ?
      @current_player = @Player2 :
      @current_player = @Player1
  end

  def play_game
    puts "Initializing Gaming Sequence..."
    while @current_player.health > 0 do # While the current players health is > 0 start the new turn and ask the question.
      puts "~~~~~~~~~~NEW TURN~~~~~~~~~~"
      puts "#{@current_player.name} here is your question"
      puts "----------------------------"

    @math_question = Question.new #generates a new math question from the question class
    @math_question.ask_question # creates the new question 

    if @math_question.correct_answer(Integer(gets.chomp)) #if the question is correct put is it correct
      puts "That is Correct"
    else
      puts "Sorry, That is incorrect. the correct answer is #{@math_question.solution}" #if it is wrong put the solution
      @current_player.lose_health # -1 health for answering incorrectly 
    end

    if @current_player.health > 0 # if the player has more than 0 health display the health and run the loop again
      puts "~~~~~~~~~~CURRENT SCORE~~~~~~~~~~"
      puts "Player1: #{@Player1.health} / 5  vs Player2: #{@Player2.health} / 5"
      current_player # switch players for the next turn
    else
      puts "~~~~~~~~~~GAME OVER~~~~~~~~~~"
      puts "#{@current_player.name} has lost the game"
    end
  end
end
end

Game.new.play_game

