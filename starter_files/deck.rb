require_relative "card"

SUITS = [ :clubs, :diamonds, :hearts, :spades ]
RANKS = [ :A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]

class Deck
attr_accessor :deck

  def initialize
    @deck = []
    make_new_deck
  end

  def make_new_deck
    SUITS.each do |suit|
      RANKS.map do |rank|
        @deck.push(Card.new(rank, suit))
      end
    end
  end

  def shuffle
    @deck.shuffle! #exclamation point keeps order of original defined array shuffled
  end

  def draw
    @deck.shift #Removes the first element of self and returns it (shifting all other elements down by one). In other words, returns value of top card on deck and removes that card from deck
  end

  def cards_left
    @deck.length
  end


end
