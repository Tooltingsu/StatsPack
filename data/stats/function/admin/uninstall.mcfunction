scoreboard objectives remove st_mine
scoreboard objectives remove st_place
scoreboard objectives remove st_move
scoreboard objectives remove st_kill
scoreboard objectives remove st_pvp
scoreboard objectives remove st_dmg_in
scoreboard objectives remove st_dmg_out
scoreboard objectives remove st_death

scoreboard objectives remove raw_walk
scoreboard objectives remove raw_fly
scoreboard objectives remove raw_sprint
scoreboard objectives remove raw_crouch
scoreboard objectives remove raw_swim
scoreboard objectives remove raw_aviate
scoreboard objectives remove raw_climb
scoreboard objectives remove raw_kill
scoreboard objectives remove raw_pvp
scoreboard objectives remove raw_dmg_in
scoreboard objectives remove raw_dmg_out
scoreboard objectives remove raw_death
scoreboard objectives remove acc_cm
scoreboard objectives remove acc_dmg_in
scoreboard objectives remove acc_dmg_out

scoreboard objectives remove st_display
scoreboard objectives remove st_sys
scoreboard objectives remove st_op

team remove st_total_label

scoreboard objectives setdisplay sidebar
tellraw @a [{"text":"卸载完成。","color":"red"}]