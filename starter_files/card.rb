class Card
  attr_accessor :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = determine_value
  end

  def determine_value
    @value = case @rank
    when :A
      1
    when 2..10
      @rank
    when :J
      10
    when :Q
      10
    when :K
      10
    end
  end

  def ==(other_card)
    rank == other_card.rank &&
    suit == other_card.suit &&
    value == other_card.value
  end

  def greater_than?(other_card)
    card_ranks = [:A, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
    card_ranks.index(self.rank) > card_ranks.index(other_card.rank)
  end
end
