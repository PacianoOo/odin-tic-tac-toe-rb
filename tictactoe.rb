puts "Welcome to TIC-TAC-TOE!"

board = ["2","z","2","3","s","g","A","h","V"]

def print_board(board)
    puts row = ["#{board[0]} " "|" " #{board[1]} " "|" " #{board[2]}  "]
    puts separator = "-----------"
    puts row =  ["#{board[3]} " "|" " #{board[4]} " "|" " #{board[5]}  "]
    puts separator
    puts row = ["#{board[6]} " "|" " #{board[7]} " "|" " #{board[6]}  "]
end

print_board(board)