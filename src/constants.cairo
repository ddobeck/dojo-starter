use cubit::types::fixed::{Fixed, FixedTrait};

const SCALING_FACTOR: u8 = 100;

const INJURY_RISK: u8 = 20;
const DEFENDER_RISK: u8 = 40;


const MAX_SCORE: usize = 21;

// court constants
const MAX_HEIGHT: usize = 4700; // 47ft is half-court
const MAX_WIDTH: usize = 5000; // 50ft is the width of the court
const MAX_SHOT_DISTANCE: u128 = 48; // 48.45ft is the distance from the hoop (25, 5.5) to the mid-court corner (50, 47) (simplified to 48ft for now)
const MAX_SHOT_DIFFICULTY: u128 = 100; // 0-100 scale

// player constants
const MAX_CONFIDENCE: u128 = 100; // 0-100 scale
const MAX_SHOOTING_SKILL: u128 = 100; // 0-100 scale
//const MAX_DRIBBLE_SKILL: u8 = 100; // 0-100 scale
const MAX_ENERGY: u128 = 350; // 0-350 scale, -10 per move

// hoop constants
const HOOP_X: Fixed = 25;
const HOOP_Y: Fixed = 5;