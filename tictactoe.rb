class TICTACTOE 


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

    #initalize board array
     def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
    end

    #method to print the board

    def print_empty
        puts row = [" 1 " "|" " 2 " "|" " 3 "]
        puts separator = "-----------"
        puts row =  [" 4 " "|" " 5 " "|" " 6 "]
        puts separator
        puts row = [" 7 " "|" " 8 " "|" " 9 "]
    end
    def print_board
        puts row = ["#{@board[0]} " "|" " #{@board[1]} " "|" " #{@board[2]}  "]
        puts separator = "-----------"
        puts row =  ["#{@board[3]} " "|" " #{@board[4]} " "|" " #{@board[5]}  "]
        puts separator
        puts row = ["#{@board[6]} " "|" " #{@board[7]} " "|" " #{@board[8]}  "]
    end

    def welcome()
        puts "Welcome to TIC-TAC-TOE!"

    end

    #converts a user input to an index of an integer
    def user_input_position(input)
        input.to_i - 1
    end
    
    #takes a users index and board the places X or O to the board
    def move(index, player_symbol)
    
        @board[index] = player_symbol
    end

    def position_taken?(index)
        if (@board[index] == " ") || (@board[index] == nil ) || (@board[index] == "")
            return false
    
        else
            return true 

        end
    end
    #checking if the input is valid and if the position is taken
    def valid_move?(index)
        if (index.between?(0,8)) == true && (position_taken?(index)) == false
            return true
        else
            return false
        end

    end

    def turn_count
        counter = 0
        @board.each do |spaces|
            if spaces == 'X' || spaces == 'O'
                counter += 1
            end
        end
        counter
    end


    def turn
        print_empty
        puts "Please select tiles from 1 - 9"
        input = gets.strip 
        index = user_input_position(input)
        if valid_move?(index) == true
            player_symbol = player
            move(index, player_symbol)
            print_board
        else
            turn
        end
    end

    def player
        if turn_count % 2 == 0
            return "X"

        else
            return "O"
        

        end
    end

    def play
        until over? == true
            turn
        end
        if won?
            winner == "X" || winner == "O"
            puts "Congratulations #{winner}!"

        elsif draw?
        puts "Draw!"
        end
    end

    def won?
        WIN_COMBINATIONS.each {|win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]   

        position_1 = @board[win_index_1] # value of board at win_index_1
        position_2 = @board[win_index_2] # value of board at win_index_2
        position_3 = @board[win_index_3] # value of board at win_index_3   position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)

        if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
            return win_combination
        elseif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
            return win_combination
        end
    }
    return false
    end

    def full?
        @board.all? {|i| i == "X" || i == "O"}

    end

    def draw?
        if !won? && full?
        return true
        else
            return false

        end
    end

    def over?
        if draw? || won?|| full?
        return true
        else
            return false
        end

    end

    def winner
        array = []
        array = won?
        if array == false
            return nil
        else
            if @board[array[0]] == "X"
                return "X"
            else
                return "O"
            end
        end
    end



end

game = TICTACTOE.new 
game.play