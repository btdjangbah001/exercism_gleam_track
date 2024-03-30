import gleam/list
import gleam/string
import gleam/int

pub fn convert(number: Int) -> String {
  let sounds =
  [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]
  |> list.filter(fn(rule){ number % rule.0 == 0 })
  |> list.map(fn(rule){ rule.1 })
  |> string.concat

  case sounds {
    "" -> int.to_string(number)
    _ -> sounds
  }
}