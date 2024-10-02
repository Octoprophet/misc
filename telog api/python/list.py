current = 0

def winning_line(strings):
    strings = set(strings)
    return len(strings) == 1 and ' ' not in strings

def row_winner(board):
    return any(winning_line(row) for row in board)

def column_winner(board):
    return row_winner(zip(*board))

def main_diagonal_winner(board):
    return winning_line(row[i] for i, row in enumerate(board))

def diagonal_winner(board):
    return main_diagonal_winner(board) or main_diagonal_winner(reversed(board))

def winner(board):
    return row_winner(board) or column_winner(board) or diagonal_winner(board)

def format_board(board):
    size = len(board)
    line = f'\n  {"+".join("-" * size)}\n'
    rows = [f'{i + 1} {"|".join(row)}' for i, row in enumerate(board)]
    return f'  {" ".join(str(i + 1) for i in range(size))}\n{line.join(rows)}'

def play_move(board, player):
    print(f'{player[current]} to play:')
    row = int(input()) - 1
    col = int(input()) - 1
    board[row][col] = player[current]
    print(format_board(board))
    check_winner(board, player)

def make_board(size):
    return [[' '] * size for _ in range(size)]

def print_winner(player):
    print(f'{player[current]} wins!')

def print_draw():
    print("It's a draw!")

def check_winner(board, player):
    global current
    if winner(board):
        return print_winner(player[current])
    draw = 0
    for n in range(len(board)):
        if ' ' not in board[n]:
            draw += 1
    if draw == len(board):
        return print_draw()
    if current == 0:
        current = 1
    elif current == 1:
        current = 0
    play_move(board, player)
    

def play_game(board_size, player1, player2):
    board = make_board(board_size)
    print(format_board(board))
    player = [player1, player2]
    play_move(board, player)

play_game(3, 'X', 'O')