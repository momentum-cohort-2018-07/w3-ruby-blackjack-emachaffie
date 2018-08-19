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
    puts "********************"
    puts 'Let\'s play Blackjack!'
    if @wallet > 9
      @shoe.shuffle
      bet
      p_deal
      d_deal
      player_check_hand
    else puts "You are out of money. Game over."
    end
  end

  def bet
    puts "You have $#{@wallet}. You bet $10."
    lose_ten
  end

  def p_deal
    2.times {@p_hand.push(@shoe.draw)}
    puts "You are dealt the #{@p_hand[@p_hand.length-2].rank} of #{@p_hand[@p_hand.length-2].suit} and the #{@p_hand[@p_hand.length-1].rank} of #{@p_hand[@p_hand.length-1].suit}."
  end

  def d_deal
    2.times {@d_hand.push(@shoe.draw)}
  end

  def player_check_hand
   @p_total = 0 
   @p_total = @p_hand.inject(0){|sum, x| sum + x.value}
   p_ace_value
   puts "The total of your hand is #{@p_total}."
   if @p_total > 21
    # total_result
    puts "You burnt!"
    random_insult
    play_again
    else
   puts "The dealer's visible card is the #{@d_hand[@d_hand.length-1].rank} of #{@d_hand[@d_hand.length-1].suit}."
   player_choice
    end
  end

  def player_choice
    puts "Would you like to (h)it or (s)tay?"
    @choice = gets.chomp
    if @choice == "h"
      p_hit
    elsif @choice == "s"
      puts "You stay. Your total is #{@p_total}"
      dealer_check_hand
    else
      player_choice
    end
  end


  def dealer_check_hand
    @d_total = 0 
    @d_total = @d_hand.inject(0){|sum, x| sum + x.value}
    d_ace_value
    puts "********************"
    puts "The dealer is inspecting his cards."
    puts "The dealer's total is #{@d_total}."
   if @d_total > 21
    puts "The dealer burnt, you win this hand and $20!!!"
    earn_twenty
    play_again
   elsif @d_total > 16
    puts "The dealer chooses to stay."
    calculate_winner
   else 
    d_hit
   end
    
  end

  def p_hit
    @p_hand.push(@shoe.draw)
    if @p_hand.length == 3
      puts "********************"
      puts "Hit me!"
    else puts "********************"
      puts "Hit me baby, one more time!"
    end
    
    puts "You are dealt the #{@p_hand[@p_hand.length-1].rank} of #{@p_hand[@p_hand.length-1].suit}." 
    player_check_hand
  end

  def d_hit
    @d_hand.push(@shoe.draw)
    if @d_hand.length == 2
      puts "********************"
      puts "The dealer hits."
    else puts "********************"
      puts "The dealer hits again."
    end
    puts "The dealer gets the #{@d_hand[@d_hand.length-1].rank} of #{@d_hand[@d_hand.length-1].suit}." 
    dealer_check_hand
  end

  def p_ace_value
    @p_total = 0 
    @p_total = @p_hand.inject(0){|sum, x| sum + x.value}
    if @p_total > 21
      @values = @p_hand.map { |i| i.value }
      if (@values.index(11) != nil) && (@p_total > 21)
        @p_hand[@values.index(11)].instance_variable_set(:@value, 1)
        @p_total = 0
        @p_total = @p_hand.inject(0){ |sum,x| sum + x.value }
    end
    end 
  end

  def d_ace_value
    @d_total = 0 
    @d_total = @d_hand.inject(0){|sum, x| sum + x.value}
    if @d_total > 21
      @values = @d_hand.map { |i| i.value }
      if (@values.index(11) != nil) && (@d_total > 21)
        @p_hand[@values.index(11)].instance_variable_set(:@value, 1)
        @p_total = 0
        @p_total = @p_hand.inject(0){ |sum,x| sum + x.value }
    end
    end 
  end

  def calculate_winner
    puts "********************"
    # @d_total = @d_hand.inject(0){|sum, x| sum + x.value}
    # @p_total = @p_hand.inject(0){|sum, x| sum + x.value}
    puts "Your total is #{@p_total}. The dealer's total is #{@d_total}."
    if @d_total > @p_total
      puts "You lose this hand."
      random_insult
    elsif @p_total > @d_total
      puts "You win this hand and $20!!!"
      earn_twenty
    else puts "You tie. The dealer wins. His house, his rules."
    end
    play_again
  end

  def play_again
    puts "Would you like to play another hand? (y)es or (n)o?"
    @choice = gets.chomp
      if @choice == "y"
        new_round
      elsif @choice == "n"
        puts "Okay, quitter."
      else
        puts "Don't be sassy."
        play_again
      end
  end

  def lose_ten
    @wallet -= 10
  end

  def earn_twenty
    @wallet += 20
  end

  def new_round
    @p_hand=[]
    @d_hand=[]
    @total=0
    @shoe=Deck.new
    @shoe.shuffle
    start_game
  end

  def random_insult
    random_num = Random.new
    random_num.rand(6)
    if random_num == 1
      puts "The dealer laughs maniacally."
    elsif random_num == 2
      puts "The dealer scoffs at your incompetence."
    elsif random_num == 3
      puts "Out of the corner of your eye, you see something leave the room. It's your dignity."
    elsif random_num == 4
      puts "Maybe you should play a game you're better at."
    elsif random_num == 5
      puts "The dealer is glad you are not letting your education get in the way of your ignorance."
    end
  end
    
end