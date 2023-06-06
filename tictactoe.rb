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


puts "Welcome to TIC-TAC-TOE!"

board = [" "," "," "," "," "," "," "," "," "]

def print_board(board)
    puts row = ["#{board[0]} " "|" " #{board[1]} " "|" " #{board[2]}  "]
    puts separator = "-----------"
    puts row =  ["#{board[3]} " "|" " #{board[4]} " "|" " #{board[5]}  "]
    puts separator
    puts row = ["#{board[6]} " "|" " #{board[7]} " "|" " #{board[6]}  "]
end



def user_input_position(user_position)
    user_position.to_i - 1

end

def move(board, position, player)
   
    board[position] = player

end

def position_taken?(board, position)
    if (board[position] == " ") || (board[position] == nil )
        puts "false"
        return false
 
    else
        puts "true"
        return true 

    end
end

def valid_move?(board, position)
    if position.between(0,8)? && position_taken?(board, position)
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

def current_player(board)
    turn_count(board) % 2 == 0? "X" : "O"
end



print_board(board)
position_taken?(board, 5)