def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  card = rand(1..11)
  return card
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_total = deal_card + deal_card
  display_card_total(card_total)
  return card_total
end

def hit?(card_total)
  prompt_user
  input = get_user_input
    if input == "s"
      card_total
    elsif input == "h"
      card_total += deal_card
    else
      invalid_command
    end
  return card_total
end

def invalid_command
  puts "Please enter a valid command."
end

def play_again
  puts "Would you like to play again? y or no"
  yes_or_no
end

def yes_or_no
  input = get_user_input
  if input == "y"
    runner
  elsif input == "n"
    puts "Thanks for playing!"
  else
  invalid_command
  end
end



def runner
  welcome
  card_total = initial_round
  loop do
    if card_total < 21
       card_total = hit?(card_total)
       display_card_total(card_total)
    elsif card_total == 21
       puts "Blackjack!"
       return play_again
    elsif card_total > 21
       end_game(card_total)
       return play_again
    end
  end
end