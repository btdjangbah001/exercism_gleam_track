import gleam/string

pub fn hey(remark: String) -> String {
  let remark = remark
  |> string.trim

  let is_shouting = string.uppercase(remark) == remark && string.lowercase(remark) != remark
  let is_question = string.ends_with(remark, "?")
  let is_empty = string.is_empty(remark)

  case remark {
    _ if is_empty -> "Fine. Be that way!"
    _ if is_shouting && is_question -> "Calm down, I know what I'm doing!"
    _ if is_shouting -> "Whoa, chill out!"
    _ if is_question -> "Sure."
    _ -> "Whatever." 
  }
}
