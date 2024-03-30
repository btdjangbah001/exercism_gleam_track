import gleam/string

pub fn message(log_line: String) -> String {
  case string.split_once(log_line, ":") {
    Ok(#(_, y)) -> string.trim(y)
    Error(_) -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]" <> _ -> "info"
    "[WARNING]" <> _ -> "warning"
    "[ERROR]" <> _ -> "error"
    _ -> "unknown log level"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
