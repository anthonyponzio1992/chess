require_relative "./pieces/piece"

class Board
  def initialize
    @rows = Array.new(8) do |row|
      next Array.new(8) if row > 1 && row < 6
      color = row > 1 ? :black : :white
      Array.new(8) { |col| Piece.new(color, self, [row, col]) }
    end
  end
  
  def move_piece(start_pos, end_pos)
    piece, self[start_pos] = self[start_pos], nil
    
    if piece.nil?
      raise ArgumentError.new("no piece to move at #{start_pos}") 
    end

    self[end_pos] = piece
    piece.pos = end_pos
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value 
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def valid_pos?(pos)
    pos.all? { |idx| (0..7).include?(idx) }
  end
end