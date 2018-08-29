require 'byebug'
require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end


  def render
    @board.grid.each_with_index do |el1, i1|
      el1.each_with_index do |el2, i2|
        if [i1,i2] == @cursor.cursor_pos
          print @board[[i1, i2]].to_s.colorize(:color => :red, :background => :white)
          print " ".colorize(:color => :red, :background => :white) unless i2 == 7
        else
          print @board[[i1, i2]].to_s.colorize(:color => :white, :background => :red)
          print " ".colorize(:color => :white, :background => :red) unless i2 == 7
        end
      end
      print "\n"
    end
  end


  def test
    while true
      render
      p @cursor.cursor_pos
      @cursor.get_input
    end
  end
end
