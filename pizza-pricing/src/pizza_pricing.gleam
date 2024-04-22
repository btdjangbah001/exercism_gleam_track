import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_tail(pizza, 0)
}

fn pizza_price_tail(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> 7 + acc
    Caprese -> 9 + acc
    Formaggio -> 10 + acc
    ExtraSauce(p) -> pizza_price_tail(p, acc + 1)
    ExtraToppings(p) -> pizza_price_tail(p, acc + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let acc = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }

  order_price_tail(order, acc)
}

fn order_price_tail(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [curr, ..rest] -> order_price_tail(rest, acc + pizza_price(curr))
  }
}
