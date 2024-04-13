// Bridge //
#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn get_piece_of_square(index: usize) -> Option<Piece> {
    let mut board = Board::new();
    board.update_board(INITIAL_POSITION_FEN);
    println!("{index}");
    return *board.get_piece_of_square(index);
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

// Main logic //
const INITIAL_POSITION_FEN: &str = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";

#[derive(Debug, Clone, Copy)]
pub enum Piece {
    WhitePawn,
    WhiteKnight,
    WhiteBishop,
    WhiteRook,
    WhiteQueen,
    WhiteKing,
    BlackPawn,
    BlackKnight,
    BlackBishop,
    BlackRook,
    BlackQueen,
    BlackKing,
}

struct Board {
    board: [Option<Piece>; 64]
}

impl Board {
    fn new() -> Self {
        Board {
            board: [None; 64],
        }
    }

    fn get_piece_of_square(&self, index: usize) -> &Option<Piece> {
        match self.board.get(index) {
            Some(piece_option) => piece_option,
            None => panic!("Square out of bounds of the chessboard."),
        }
    }

    fn update_board(&mut self, fen: &str) {
        let only_pieces_position = fen.split(' ').next().unwrap().replace('/', "");

        let mut counter = 0;
        for c in only_pieces_position.chars() {
            match c {
                '1'..='8' => {
                    let num = c.to_digit(10).unwrap() as usize;
                    if num > 8 {
                        panic!("Too many blank spaces on that row, corrupted FEN position.");
                    }
                    counter += num;
                },
                'r' => { self.board[counter] = Some(Piece::BlackRook); counter += 1; },
                'n' => { self.board[counter] = Some(Piece::BlackKnight); counter += 1; },
                'b' => { self.board[counter] = Some(Piece::BlackBishop); counter += 1; },
                'q' => { self.board[counter] = Some(Piece::BlackQueen); counter += 1; },
                'k' => { self.board[counter] = Some(Piece::BlackKing); counter += 1; },
                'p' => { self.board[counter] = Some(Piece::BlackPawn); counter += 1; },
                'R' => { self.board[counter] = Some(Piece::WhiteRook); counter += 1; },
                'N' => { self.board[counter] = Some(Piece::WhiteKnight); counter += 1; },
                'B' => { self.board[counter] = Some(Piece::WhiteBishop); counter += 1; },
                'Q' => { self.board[counter] = Some(Piece::WhiteQueen); counter += 1; },
                'K' => { self.board[counter] = Some(Piece::WhiteKing); counter += 1; },
                'P' => { self.board[counter] = Some(Piece::WhitePawn); counter += 1; },
                _ => panic!("Invalid character in FEN string"),
            }
        }
    }
}
