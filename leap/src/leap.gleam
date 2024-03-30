pub fn is_leap_year(year: Int) -> Bool {
  //year % 100 == 0 && year % 400 == 0 || year % 100 != 0 && year % 4 == 0

  case is_divisible(year, 100) {
    True -> is_divisible(year, 400)
    False -> is_divisible(year, 4)
  }
}

fn is_divisible(n: Int, mod: Int) -> Bool {
  n % mod == 0
}

