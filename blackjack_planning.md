# Blackjack Planning

## Directions

Read through [the rules of blackjack](https://en.wikipedia.org/wiki/Blackjack) carefully. After reading through them, write out the steps to run the game in outline format. (See the additional resources for more on the rules of blackjack.)

* The game should start the player with $100 and bets are $10.
* The only valid moves are hit and stand.
* Allow the player to keep playing as long as they have money.
* The dealer uses one deck in their shoe and reshuffles after each round.
- Deck is shuffled.
- Dealer deals two cards to player's hand (one visible and one not) and two cards to self (same visibility) 
- Dealer asks if player would like to hit or stay
- Player assesses card values of own hand and dealer's visible hand
- Player decides hit or stay.
- If hit, player gets top card of deck added to hand. Card is visible. Value of card is added to player's total
- If total >21, player busts and dealer wins. If total < 21, no bust, 
repeat last 3 steps, starting with dealer asks if player would like to hit or stay
- If stay, dealer's turn
- Dealer assesses card values of own hand and of player's visible hand
- Dealer hits or stays self
- If dealer's total >21, dealer busts and player wins. If total <= 21, no bust
- Once dealer no longer wants to hit, value of hands are compared. Closest to 21 wins. If both have 21, dealer wins cuz he's a turd.
- Dealer reshuffles


After that, go through your steps and find all the actors -- that is, nouns that take actions. Write down what they are responsible for and what other actors they collaborate with. For example, for a card, you might write down:

```
Card
  Responsibilities
    - has a rank and suit
    - has a point value. Aces' point values depend on the rest of the Hand.
  Collaborators
    - collected into a Deck
    - collected into a Hand for each Player and a Hand for the Dealer
```

Player
  Responsibilities
    - Has a hand with a total
    - Decides whether to hit or stay

Dealer
  Responibilities
    - Deals cards
    - Has a hand with a total
    - Decides whether to hit or stay
    
Deck
  - Made up of cards
  - Has a number value that changes at cards are dealt
  - Runs out after 52 draws


Hand?
  - Made up of cards
  - One hand for player, one hand for dealer
  - Has a total


Given your notes, talk about how you might translate these into classes. You do not have to write the code for each method, but do sketch out the classes and methods.

Think about the nouns (the most important ones -- think big categories here) in the blackjack rules as your classes. What those nouns do, the actions they can take or how they behave, become the methods in those classes.

## Additional Resources

- Other Blackjack rule summaries:

  - <http://www.pagat.com/banking/blackjack.html>
  - <http://wizardofodds.com/games/blackjack/basics/#toc-Rules>

  **** To run game, in console: ruby bin/blackjack.rb