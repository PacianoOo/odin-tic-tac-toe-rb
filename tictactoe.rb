board = [" "," "," "," "," "," "," "," "," "]

WIN_COMBINATIONS = [ 
[0,1,2], # top_row 
[3,4,5], # middle_row 
[6,7,8], # bottom_row 
[0,3,6], # left_column 
[1,4,7], # center_column 
[2,5,8], # right_column 
[0,4,8], # left_diagonal 
[6,4,2] # right_diagonal 
]


#method to print the board

def print_board(board)
    puts row = ["#{board[0]} " "|" " #{board[1]} " "|" " #{board[2]}  "]
    puts separator = "-----------"
    puts row =  ["#{board[3]} " "|" " #{board[4]} " "|" " #{board[5]}  "]
    puts separator
    puts row = ["#{board[6]} " "|" " #{board[7]} " "|" " #{board[8]}  "]
end

def welcome()
    puts "Welcome to TIC-TAC-TOE!"

end

#converts a user input to an index of an integer
def user_input_position(input)

    return input.to_i - 1
end
#takes a users index and board the places X or O to the board
def move(board, index, player = 'X')
   
    board[index] = player
    return board
end

def position_taken?(board, index)
    if (board[index] == " ") || (board[index] == nil ) ||(board[index] == "")
        puts "false"
        return false
 
    else
        puts "true"
        return true 

    end
end
#checking if the input is valid and if the position is taken
def valid_move?(board, index)
    if (index.between?(0,8)) == true && (position_taken?(board, index)) == false
        return true
    else
        return false
    end

end

def turn_count(board)
    counter = 0
    board.each do |spaces|
        if spaces == 'X' || spaces == 'O'
            counter += 1
        end
    end
    counter
end


def turn(board)
    puts "Please select tiles from 1 - 9"
    input = gets.strip 
    index = user_input_position(input)
    if valid_move?(board, index) == true
        move(board, index)
        print_board(board)
    else
        turn(board)
    end
end

def player(board)
    turn_count(board) % 2 == 0? "X" : "O"
end

def play(board)
    until over?(board)
        turn(board)
    end
    if won?(board)
        winner(board) == "X" || winner(board) == "O"
        puts "Congratulations #{winner(board)}!"

    elseif draw?(board)
    puts "Draw!"
    end
end

def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]   
      position_1 = board[win_index_1] # value of board at win_index_1
      position_2 = board[win_index_2] # value of board at win_index_2
      position_3 = board[win_index_3] # value of board at win_index_3   position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    end
end

def full?(board)
    board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
    if !won?(board) && full?(board)
      return true
    elsif !won?(board) && !full?(board)
      return false
    else won?(board)
      return false
    end
 end

 def over?(board)
    if draw?(board) || won?(board) || full?(board)
      return true
    end
 end

 def winner(board)
    if won?(board)
       return board[won?(board)[0]]
    end
 end

welcome()
9.times do
    turn(board)
end
#turn(board)
#print_board(board)
#puts "Where would you like to go?"
#input = gets.strip
#index = user_input_position(input)
#move(board, index)
#print_board(board)

