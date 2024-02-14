game <- function() {

    play <- T
    tie <- 0
    win <- 0
    loss <- 0

   while(play){

        flush.console()
        hands = c("rock", "paper", "scissors")
        cpu = sample(hands, 1)
        user = readline("\nChoose your hands (rock, paper, scissors, quit) : ")

        if (user == "quit") break

        if (user == cpu) {
            cat("\nuser choose: ", user)
            cat("\ncpu choose: ", cpu)
            cat("\nTie\n")
            tie = tie + 1

            } else if (user == "rock" & cpu == "scissors" | user == "paper" &
              cpu == "rock" | user == "scissors" & cpu == "paper") {
                cat("\nuser choose: ", user)
                cat("\ncpu choose: ", cpu)
                cat("\nYou Win\n")
                win = win + 1

            } else {
                cat("\nuser choose: ", user)
                cat("\ncpu choose: ", cpu)
                cat("\nYou Loss\n")
                loss = loss + 1

            }

    }

       cat("\nResult : ", "Win: ",win, "Tie: ", tie, "Loss: ",loss)

}
