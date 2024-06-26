import gleam/list

pub fn wines_of_color(wines: List(Wine), color: Color) -> List(Wine) {
  wines
  |> list.filter(fn(wine) { wine.color == color} )  
}

pub fn wines_from_country(wines: List(Wine), country: String) -> List(Wine) {
  let predicate = fn(wine: Wine){ wine.country == country}
  list.filter(wines, predicate)
}

// Please define the required labelled arguments for this function
pub fn filter(wines: List(Wine), country country: String, color color: Color) -> List(Wine) {
  wines
  |> list.filter(fn(wine){ wine.color == color && wine.country == country })
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}
