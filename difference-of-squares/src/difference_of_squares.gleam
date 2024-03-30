import gleam/list
import gleam/int

pub fn square_of_sum(n: Int) -> Int {
  list.range(1, n)
  |> int.sum
  |> square
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(1, n)
  |> list.map(square)
  |> int.sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}

//fn sum_n(n: Int, acc: Int) -> Int {
//  case n {
//    0 -> acc
//    _ -> sum_n(n - 1, acc + n)
//  }
//}
//
//fn squares_n(n: Int, acc: Int) -> Int {
//  case n {
//    0 -> acc
//    _ -> squares_n(n - 1, acc + {n * n})
//  }
//}

fn square(n: Int) -> Int {
  n * n
}
