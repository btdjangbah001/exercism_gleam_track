import gleam/order.{type Order}
import gleam/float
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  {f -. 32.0} /. 1.8
}

fn convert_temp(t: Temperature) -> Float {
  case t {
    Celsius(x) -> x
    Fahrenheit(x) -> fahrenheit_to_celsius(x) 
  }
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
//  case left, right {
//    Celsius(x), Celsius(y) -> float.compare(x, y)
//    Fahrenheit(x), Fahrenheit(y) -> float.compare(x, y)
//    Celsius(x), Fahrenheit(y)  -> float.compare(x, fahrenheit_to_celsius(y))
//    Fahrenheit(x), Celsius(y) -> float.compare(fahrenheit_to_celsius(x), y)
//  }
  float.compare(convert_temp(left), convert_temp(right))
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(fn(l, r){compare_temperature(l.temperature, r.temperature)})
}
