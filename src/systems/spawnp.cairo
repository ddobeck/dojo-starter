#[system]
mod spawnp {
    use array::ArrayTrait;
    use traits::Into;

    use cubit::types::fixed::{Fixed, FixedTrait, ONE_u128};

    use dojo::world::Context;
    use dojo_examples::components::game::Game;
    use dojo_examples::components::player::Player;

    fn execute(ctx: Context) -> (u32, felt252) {
        let player_id: felt252 = ctx.origin.into();

        let game_id = ctx.world.uuid();

        set !(
            ctx.world, 
            game_id.into(), 
            (Game { 
                game_id, 
                is_finished: false, 
                creator: player_id
                })
            );

        
        let fiddy = FixedTrait::new(50 * ONE_u128, false);
        let three_fiddy = FixedTrait::new(350 * ONE_u128, false);
        let sixty = FixedTrait::new(60 * ONE_u128, false);
        let twenty_five = FixedTrait::new(25 * ONE_u128, false);
        let fifteen = FixedTrait::new(15 * ONE_u128, false);

        set !(
            ctx.world, 
            (game_id, player_id).into(), 
            (Player { 
                score: 0, 
                energy: three_fiddy, 
                confidence: fiddy, 
                shooting_skill: sixty,
                x: twenty_five,
                y: fifteen,
                })
            );

        (game_id, player_id)
    }
}