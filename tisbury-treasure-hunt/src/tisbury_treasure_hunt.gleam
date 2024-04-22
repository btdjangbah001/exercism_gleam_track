import gleam/iterator

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(a, b) = place_location
  #(b, a)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  iterator.from_list(treasures)
  |> iterator.filter(fn(p) { p.1 == place_location_to_treasure_location(place.1) })
  |> iterator.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure.0, place.0, desired_treasure.0 {
    "Brass Spyglass", "Abandoned Lighthouse", _ -> True
    "Amethyst Octopus", "Stormy Breakwater", x if x == "Crystal Crab" || x == "Glass Starfish" -> True
    "Vintage Pirate Hat", "Harbor Managers Office", x if x == "Model Ship in Large Bottle" || x == "Antique Glass Fishnet Float" -> True
    _, _, _ -> False
  }
}
