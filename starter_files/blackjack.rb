puts "TODO Implement the game of blackjack."

class BlackjackGame
  attr_accessor :p_hand, :d_hand, :wallet, :shoe, :p_total, d_total
  def initialize (wallet)
    @p_hand = []
    @d_hand = []
    @wallet = wallet
    @shoe = Deck.new
    @shoe.shuffle
    @p_total = 0
    @d_total = 0
  end

  def start_game
    puts 'Let\'s play Blackjack!\n\n'
    if @wallet > 9
        bet
        p_deal
    else puts 
    end
  end

  def bet
    puts 'You have $#{@wallet} and bet $10.'
  end

  def p_deal
   2.times {@p_hand.push(@shoe.draw)}
   player_analyze_hand
  end

  def d_deal
    2.times {@d_hand.push(@shoe.draw)}
  end

  def player_analyze_hand
   @p_total = 0 
   @p_total = @hand.
  end

  def dealer_analyze_hand
  end

  def p_hit
  end

  def d_hit
  end

  def stay
  end

  def calculate_winner
  end

  def new_round
  end



  # On game start: wallet = $100, player bets $10, is dealt two cards
  #Dealer asks if player would like to hit or stay
  # - Player assesses card values of own hand and dealer's visible hand
  # - Player decides hit or stay.
  # - If hit, player gets top card of deck added to hand. Card is visible. Value of card is added to player's total
  # - If total >21, player busts and dealer wins. If total < 21, no bust, 
  # repeat last 3 steps, starting with dealer asks if player would like to hit or stay
  # - If stay, dealer's turn
  # - Dealer assesses card values of own hand and of player's visible hand
  # - Dealer hits or stays self
  # - If dealer's total >21, dealer busts and player wins. If total <= 21, no bust
  # - Once dealer no longer wants to hit, value of hands are compared. Closest to 21 wins. If both have 21, dealer wins cuz he's a turd.
  # - Dealer reshuffles
    
end

start_game