use box::BoxTrait;
use traits::Into;

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Game {
    game_id: u32,
    is_finished: bool,
    creator: felt252,
}


trait GameTrait {
    fn tick(self: @Game) -> bool;
}

impl GameImpl of GameTrait {
    fn tick(self: @Game) -> bool {
        
        if *self.is_finished {
            return false;
        }

        true
    }
}