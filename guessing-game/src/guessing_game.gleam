pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    x if x < 41 -> "Too low"
    x if x > 43 -> "Too high"
    x if x == 41 || x == 43 -> "So close"
    _ -> "Wrong"
  }
}
