def games():
  tie = 0
  player_score = 0
  com_score = 0

  while True:

    player = input("Enter your hand (rock, paper, scissors, quit) : ")
    print("You choose : ",player)

    import random
    hand_list = ["scissors", "paper", "rock"]
    com = random.choice(hand_list)
    print("Com choose : ",com)



    if player == com:
        print("Tie")
        tie += 1
    elif player == "scissors" and com == "rock" or player == "rock" and com == "paper" or player == "paper" and com == "scissors":
         print("You lose")
         com_score += 1

    elif player == "scissors" and com == "paper" or player == "paper" and com == "rock" or player == "rock" and com == "scissors":
         print("You win")
         player_score += 1

    elif player == "quit":
        print()
        print("Game Over")
        print()
        print("You score is   ",player_score)
        print("Com score is   ",com_score)
        print("Tie score is   ",tie)
        break
    else:
        print("Try Again")
