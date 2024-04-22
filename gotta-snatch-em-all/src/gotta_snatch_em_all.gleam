import gleam/set.{type Set}
import gleam/list
import gleam/result
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  let size = set.size(collection)
  let collection = set.insert(collection, card)
  #(size == set.size(collection), collection)
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  case set.contains(collection, my_card), set.contains(collection, their_card) {
    True, True -> #(False, set.delete(collection, my_card))
    True, False -> {
      let collection = collection
      |> set.delete(my_card)
      |> set.insert(their_card)
      #(True, collection)
      }
    _, _ -> #(False, set.insert(collection, their_card))
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  set.to_list(
    collections
    |> list.reduce(fn(a, b){ set.intersection(a, b) })
    |> result.unwrap(_, set.new()))
  |> list.sort(string.compare)

}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.reduce(fn(a, b){ set.union(a, b) })
  |> result.unwrap(_, set.new())
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  set.filter(collection, fn(t){ string.starts_with(t, "Shiny ") })
}
