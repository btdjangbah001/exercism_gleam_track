import gleam/option.{type Option, Some, None }
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(health: 0, level: x, ..) if x >= 10 -> Some(Player(..player, mana: Some(100), health: 100))
    Player(health: 0, ..) -> Some(Player(..player, health: 100))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
    case player.mana {
    None -> #(Player(..player, health: int.max(0, player.health - cost)), 0)
    Some(x) if x >= cost -> #(Player(..player, mana: Some(x - cost)), cost * 2)
    _ -> #(player, 0)
  }

//  case player {
//    Player(mana: Some(x), ..) if x >= cost -> #(Player(..player, mana: Some(x - cost)), cost * 2)
//    Player(mana: None, health: x ..) if x < cost -> #(Player(..player, health: 0), 0)
//    Player(mana: None, ..) -> #(Player(..player, health: player.health - cost), 0)
//    _ -> #(player, 0)
//  }
}
