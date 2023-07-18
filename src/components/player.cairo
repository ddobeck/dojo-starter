
use cubit::types::fixed::{Fixed, FixedTrait, ONE_u128};
use cubit::math::core::{sqrt};

use dojo_examples::constants::{ HOOP_X, HOOP_Y, MAX_SHOT_DISTANCE, MAX_CONFIDENCE, MAX_SHOOTING_SKILL };

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Player {
    score: u8,
    energy: u128,
    confidence: Fixed,
    shooting_skill: Fixed,
    x: Fixed,
    y: Fixed,
}

trait PlayerTrait {
    fn can_continue(self: @Player) -> bool;
    fn shot_difficulty(self: @Player) -> Fixed;
}

impl PlayerImpl of PlayerTrait {
    fn can_continue(self: @Player) -> bool {
        if *self.energy == 0 {
            return false;
        }

        true
    }

    fn shot_difficulty(self: @Player) -> Fixed {

        // Pythagorean theorem
        let x_distance_sq = (HOOP_X - *self.x) * (HOOP_X - *self.x);
        let y_distance_sq = (HOOP_Y - *self.y) * (HOOP_Y - *self.y);
        //let testing = FixedTrait::from_int(x_distance_sq + y_distance_sq, true);
        let distance = sqrt(x_distance_sq + y_distance_sq); 

        let one_hundred = FixedTrait::new(100 * ONE_u128, false);
        //normalize distance
        let norm_distance: Fixed = (distance / MAX_SHOT_DISTANCE) * one_hundred;

        //normalize confidence & shooting skill
        let norm_player_shot = (*self.confidence * *self.shooting_skill) / (MAX_CONFIDENCE * MAX_SHOOTING_SKILL) * one_hundred;

        //difficulty is a function of normalized distance, confidence, and shooting skill. higher confidence & shooting skill lower difficulty.
        let difficulty = norm_distance / norm_player_shot;

        difficulty
    }
}