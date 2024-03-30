import gleam/int
//import gleam/string
//import gleam/list
import gleam/result

pub fn egg_count(number: Int) -> Int {
//  int.to_base2(number)
//  |> string.to_graphemes
//  |> list.filter(fn(c){ c == "1" })
//  |> list.length

  int.digits(number, 2)
  |> result.unwrap([])
  |> int.sum
}

