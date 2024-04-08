import gleam/regex
import gleam/list
import gleam/io

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("^\\[([A-Z]+)\\] .+$")
  regex.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("[^\\s<>]+")
  regex.scan(re, line)
  |> list.map(fn(match: regex.Match){ match.content })
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("(?<=\\bUser\\s)(\\w+)")
  let vals = 
    regex.scan(re, line) 
    |> list.map(fn(match: regex.Match){ match.content })

  io.debug(vals)
  
  case vals {
    [name] -> "[USER] " <> name <> " " <> line
    _ -> line
  }
}

pub fn main() {
  io.debug(split_line("[INFO] Start.<*>[INFO] Processing...<~~~>[INFO] Success."))
}