BOARD CLASS
- generate board
- can check for win
- checks vertically for win (can run after each turn as helper)
- checks horizontally for win (can run after each turn as helper)
- checks diagonal for win (can run after each turn as helper)
- can check if move is valid
- can use array of empty strings,  use indexes to map the board
- or multiple arrays row a, b, c… and columns a,b, c… (attributes)
- is board full?

GAME CLASS
- player can make move
- computer can make move
- can change turns after turn

PLAYER CLASS
- init(player, piece)
- players are X’s
- players move(column) (gets.chomp)

COMPUTER CLASS
- init(comp, piece)
- computer is O’s
- computers move (generate random number to choose a drop spot???)

PLAY GAME CLASS
- might not need, could accomplish in other classes
- terminal feedback messages (win/loss)
- drop X or O into place after move
- welcome message “P” to play “Q” to quit