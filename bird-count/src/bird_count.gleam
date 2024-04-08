import gleam/list
pub fn today(days: List(Int)) -> Int {
  case days {
    [today, ..] -> today  
    _ -> 0 
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [today, ..rest] -> list.prepend(rest, today + 1)
    _ -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(list.drop(rest, 1))
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [today, ..rest] -> today + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [today, ..rest] if today >= 5 -> 1 + busy_days(rest)
    [_, ..rest] -> 0 + busy_days(rest)
  }
}
