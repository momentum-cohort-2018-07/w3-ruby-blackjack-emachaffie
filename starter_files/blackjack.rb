require_relative "deck"
require_relative "card"

class BlackjackGame
  attr_accessor :p_hand, :d_hand, :wallet, :shoe, :p_total, :d_total
  def initialize (wallet)
    @p_hand = []
    @d_hand = []
    @wallet = wallet
    @shoe = Deck.new
    @p_total = 0
    @d_total = 0
    start_game
  end

  def start_game
    puts 'Let\'s play Blackjack!'
    if @wallet > 9
      @shoe.shuffle
      lose_ten
      bet
      p_deal
    else puts "Game over"
    end
  end

  def bet
    puts "You have $#{@wallet}. You bet $10."
  end

  def p_deal
   2.times {@p_hand.push(@shoe.draw)}
  #  puts @p_hand[@p_hand.length-1].rank
   puts "You are dealt the #{@p_hand[@p_hand.length-1].rank} of #{@p_hand[@p_hand.length-1].suit} and the #{@p_hand[@p_hand.length].rank} of #{@p_hand[@p_hand.length].suit}."
   player_analyze_hand
  end

  def d_deal
    2.times {@d_hand.push(@shoe.draw)}
    dealer_analyze_hand
  end

  def player_analyze_hand
   @p_total = 0 
   @p_total = @p_hand.inject(0){|sum, x| sum + x.value}
   if @p_total > 21
    # total_result
    puts "You burnt!"
    lose_ten
    new_round
    else
   puts "The total of your hand is #{@p_total}"
   player_choice
    end
  end

  def player_choice
    puts "Would you like to (h)it or (s)tay?"
    @choice = gets.chomp
    if @choice == "h"
      p_hit
    elsif @choice == "s"
      print "You stay. Your total is #{@p_total}"
    end
  end


  def dealer_analyze_hand
  end

  def p_hit
    puts "Hit me!"
    @p_hand.push(@shoe.draw)
    puts "You are dealt the #{@p_hand[@p_hand.length-1].rank} of #{@p_hand[@p_hand.length-1].suit}." 
    player_analyze_hand
  end

  def d_hit
  end

  def stay
  end

  def calculate_winner
    new_round
  end

  def lose_ten
    @wallet -= 10
  end

  def earn_ten
  end

  def new_round
    @p_hand=[]
    @d_hand=[]
    @total=0
    @shoe=Deck.new
    @shoe.shuffle
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