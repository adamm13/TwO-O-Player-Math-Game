
class Question
   attr_reader :solution
  
  def initialize # initialize the question class to generate two random numbers from 1-50 and hold the answer in solution
    @number1 = rand(1..50)
    @number2 = rand(1..50)
    @solution = @number1 + @number2
  end

  def ask_question # function to ask the question
    puts "What is #{@number1} + #{@number2}?"
  end

  def correct_answer(answer) # check if the answer given is the correct answer.
    answer == @solution
  end

end