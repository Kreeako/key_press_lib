-- just do require("key_press_lib") in your script and you can call the functions

local nv = native_invoker
local function set_key(padIndex, control, amount)
    nv.begin_call()
    nv.push_arg_int(padIndex)
    nv.push_arg_int(control)
    nv.push_arg_float(amount)
    nv.end_call(0xE8A25867FBA3B05E)
    return nv.get_return_value_bool()
end

-- call like this: mouse_pos(int x_position 0-100, int y_position 0-100)
local function set_cursor_pos(x, y)
    nv.begin_call()
    nv.push_arg_float(x / 100)
    nv.push_arg_float(y / 100)
    nv.end_call_2(0xFC695459D4D0E219)
    return nv.get_return_value_bool()
end

-- call like this: press_key(key.key_from_the_table[int index], int times_to_repeat, int how_long_to_wait_between_key_presses)
function press_key(key, num, yield)
    for i = 0, num - 1 do
        set_key(2, key, 1)
        util.yield()
        set_key(2, key, 0)
        util.yield(yield)
    end
end

-- call like this: press_keygroup(key.key_from_the_table, int times_to_repeat, int how_long_to_wait_between_key_presses)
function press_keygroup(keygroup, num, yield)
    if keygroup == nil then
        util.toast("Keygroup nil.")
        util.log("Keygroup nil.")
        return
    end

    for i = 0, num - 1 do
        for index, key in ipairs(keygroup) do
            set_key(2, key, 1)
            util.yield()
            set_key(2, key, 0)
        end
        util.yield(yield)
    end
end

key = {
    a = {
        34,  -- INPUT_MOVE_LEFT_ONLY
        63,  -- INPUT_VEH_MOVE_LEFT_ONLY
        89,  -- INPUT_VEH_FLY_YAW_LEFT
        133, -- INPUT_VEH_SUB_TURN_HARD_LEFT
        147, -- INPUT_PARACHUTE_TURN_LEFT_ONLY
        234, -- INPUT_SCRIPT_PAD_LEFT
        338  -- INPUT_VEH_HYDRAULICS_CONTROL_LEFT
    },

    b = {
        29,  -- INPUT_SPECIAL_ABILITY_SECONDARY
        305  -- INPUT_REPLAY_STARTPOINT
    },

    c = {
        26,  -- INPUT_LOOK_BEHIND
        79,  -- INPUT_VEH_LOOK_BEHIND
        253, -- INPUT_CREATOR_RT
        319, -- INPUT_REPLAY_TOGGLETIME
        324  -- INPUT_REPLAY_TIMELINE_DUPLICATE_CLIP
    },

    d = {
        9,   -- INPUT_SCRIPTED_FLY_LR
        30,  -- INPUT_MOVE_LR
        35,  -- INPUT_MOVE_RIGHT_ONLY
        59,  -- INPUT_VEH_MOVE_LR
        64,  -- INPUT_VEH_MOVE_RIGHT_ONLY
        90,  -- INPUT_VEH_FLY_YAW_RIGHT
        134, -- INPUT_VEH_SUB_TURN_HARD_RIGHT
        146, -- INPUT_PARACHUTE_TURN_LR
        148, -- INPUT_PARACHUTE_TURN_RIGHT_ONLY
        195, -- INPUT_FRONTEND_AXIS_X
        218, -- INPUT_SCRIPT_LEFT_AXIS_X
        235, -- INPUT_SCRIPT_PAD_RIGHT
        266, -- INPUT_MOVE_LEFT
        267, -- INPUT_MOVE_RIGHT
        278, -- INPUT_VEH_MOVE_LEFT
        279, -- INPUT_VEH_MOVE_RIGHT
        339, -- INPUT_VEH_HYDRAULICS_CONTROL_RIGHT
        342  -- INPUT_VEH_HYDRAULICS_CONTROL_UD
    },

    e = {
        38,	 -- INPUT_PICKUP
        46,	 -- INPUT_TALK
        51,	 -- INPUT_CONTEXT
        54,	 -- INPUT_WEAPON_SPECIAL_TWO
        86,	 -- INPUT_VEH_HORN
        103, -- INPUT_VEH_GRAPPLING_HOOK
        119, -- INPUT_VEH_FLY_VERTICAL_FLIGHT_MODE
        153, -- INPUT_PARACHUTE_BRAKE_RIGHT
        184, -- INPUT_CELLPHONE_CAMERA_SELFIE
        206, -- INPUT_FRONTEND_RB
        350, -- INPUT_VEH_CAR_JUMP
        351, -- INPUT_VEH_ROCKET_BOOST
        355, -- INPUT_VEH_FLY_BOMB_BAY
        356  -- INPUT_VEH_FLY_COUNTER
    },

    f = {
        23,	 -- INPUT_ENTER
        49,	 -- INPUT_ARREST
        75,	 -- INPUT_VEH_EXIT
        145, -- INPUT_PARACHUTE_DETACH
        185, -- INPUT_CELLPHONE_CAMERA_DOF
        251, -- INPUT_CREATOR_RS
        144	 -- INPUT_PARACHUTE_DEPLOY
    },

    g = {
        47,  -- INPUT_DETONATE
        58,  -- INPUT_THROW_GRENADE
        113, -- INPUT_VEH_FLY_UNDERCARRIAGE
        183  -- INPUT_CELLPHONE_CAMERA_GRID
    },

    h = {
        74,	 -- INPUT_VEH_HEADLIGHT
        101, -- INPUT_VEH_ROOF
        104, -- INPUT_VEH_SHUFFLE
        304  -- INPUT_REPLAY_HIDEHUD
    },

    k = {
        311 -- INPUT_REPLAY_SHOWHOTKEY
    },

    l = {
        182 -- INPUT_CELLPHONE_CAMERA_FOCUS_LOCK
    },

    m = {
        244, -- INPUT_INTERACTION_MENU
        301  -- INPUT_REPLAY_NEWMARKER
    },

    n = {
        249, -- INPUT_PUSH_TO_TALK
        306  -- INPUT_REPLAY_ENDPOINT
    },

    p = {
        199 -- INPUT_FRONTEND_PAUSE
    },

    q = {
        44,	 -- INPUT_COVER
        52,	 -- INPUT_CONTEXT_SECONDARY
        85,	 -- INPUT_VEH_RADIO_WHEEL
        138, -- INPUT_VEH_PUSHBIKE_FRONT_BRAKE
        141, -- INPUT_MELEE_ATTACK_HEAVY
        152, -- INPUT_PARACHUTE_BRAKE_LEFT
        205, -- INPUT_FRONTEND_LB
        264  -- INPUT_MELEE_ATTACK2
    },

    r = {
        45,	 -- INPUT_RELOAD
        80,	 -- INPUT_VEH_CIN_CAM
        140, -- INPUT_MELEE_ATTACK_LIGHT
        250, -- INPUT_CREATOR_LS
        263, -- INPUT_MELEE_ATTACK1
        310  -- INPUT_REPLAY_RESTART
    },

    s = {
        8,	 -- INPUT_SCRIPTED_FLY_UD
        31,	 -- INPUT_MOVE_UD
        33,	 -- INPUT_MOVE_DOWN_ONLY
        72,	 -- INPUT_VEH_BRAKE
        78,	 -- INPUT_VEH_HOTWIRE_RIGHT
        88,	 -- INPUT_VEH_FLY_THROTTLE_DOWN
        130, -- INPUT_VEH_SUB_THROTTLE_DOWN
        139, -- INPUT_VEH_PUSHBIKE_REAR_BRAKE
        149, -- INPUT_PARACHUTE_PITCH_UD
        151, -- INPUT_PARACHUTE_PITCH_DOWN_ONLY
        196, -- INPUT_FRONTEND_AXIS_Y
        219, -- INPUT_SCRIPT_LEFT_AXIS_Y
        233, -- INPUT_SCRIPT_PAD_DOWN
        268, -- INPUT_MOVE_UP
        269, -- INPUT_MOVE_DOWN
        302  -- INPUT_REPLAY_RECORD
    },

    t = {
        245, -- INPUT_MP_TEXT_CHAT_ALL
        309  -- INPUT_REPLAY_TOOLS
    },

    u = {
        303 -- INPUT_REPLAY_SCREENSHOT
    },

    v = {
        0,	 -- INPUT_NEXT_CAMERA
        236, -- INPUT_SCRIPT_SELECT
        320, -- INPUT_REPLAY_TOGGLETIPS
        325  -- INPUT_REPLAY_TIMELINE_PLACE_CLIP
    },

    w = {
        32,  -- INPUT_MOVE_UP_ONLY
        71,  -- INPUT_VEH_ACCELERATE
        77,  -- INPUT_VEH_HOTWIRE_LEFT
        87,  -- INPUT_VEH_FLY_THROTTLE_UP
        129, -- INPUT_VEH_SUB_THROTTLE_UP
        136, -- INPUT_VEH_PUSHBIKE_PEDAL
        150, -- INPUT_PARACHUTE_PITCH_UP_ONLY
        232  -- INPUT_SCRIPT_PAD_UP
    },

    x = {
        73,	 -- INPUT_VEH_DUCK
        105, -- INPUT_VEH_DROP_PROJECTILE
        120, -- INPUT_VEH_FLY_DUCK
        154, -- INPUT_PARACHUTE_SMOKE
        186, -- INPUT_CELLPHONE_CAMERA_EXPRESSION
        252, -- INPUT_CREATOR_LT
        323, -- INPUT_REPLAY_TIMELINE_PICKUP_CLIP
        337, -- INPUT_VEH_HYDRAULICS_CONTROL_TOGGLE
        345, -- INPUT_VEH_MELEE_HOLD
        354, -- INPUT_VEH_BIKE_WINGS
        357  -- INPUT_VEH_TRANSFORM
    },

    y = {
        246 -- INPUT_MP_TEXT_CHAT_TEAM
    },

    z = {
        20, -- INPUT_MULTIPLAYER_INFO
        48 -- INPUT_HUD_SPECIAL
    },

    number_1 = {
        157 -- INPUT_SELECT_WEAPON_UNARMED
    },

    number_2 = {
        158 -- INPUT_SELECT_WEAPON_MELEE
    },

    number_3 = {
        160 -- INPUT_SELECT_WEAPON_SHOTGUN
    },

    number_4 = {
        164 -- INPUT_SELECT_WEAPON_HEAVY
    },

    number_5 = {
        165 -- INPUT_SELECT_WEAPON_SPECIAL
    },

    number_6 = {
        159	-- INPUT_SELECT_WEAPON_HANDGUN
    },

    number_7 = {
        161	-- INPUT_SELECT_WEAPON_SMG
    },

    number_8 = {
        162	-- INPUT_SELECT_WEAPON_AUTO_RIFLE
    },

    number_9 = {
        163	-- INPUT_SELECT_WEAPON_SNIPER
    },

    hyphen = {
        84 -- INPUT_VEH_PREV_RADIO_TRACK
    },

    comma = {
        82 -- INPUT_VEH_PREV_RADIO
    },

    period = {
        81 -- INPUT_VEH_NEXT_RADIO
    },

    left_square_bracket = {
        39,	 -- INPUT_SNIPER_ZOOM
        41,	 -- INPUT_SNIPER_ZOOM_OUT_ONLY
        43,	 -- INPUT_SNIPER_ZOOM_OUT_SECONDARY
        100, -- INPUT_VEH_SELECT_PREV_WEAPON
        116, -- INPUT_VEH_FLY_SELECT_PREV_WEAPON
        274, -- INPUT_SNIPER_ZOOM_IN
        275, -- INPUT_SNIPER_ZOOM_OUT
        276, -- INPUT_SNIPER_ZOOM_IN_ALTERNATE
        277, -- INPUT_SNIPER_ZOOM_OUT_ALTERNATE
        312  -- INPUT_REPLAY_CYCLEMARKERLEFT
    },

    right_square_bracket = {
        40,  -- INPUT_SNIPER_ZOOM_IN_ONLY
        42,  -- INPUT_SNIPER_ZOOM_IN_SECONDARY
        197, -- INPUT_FRONTEND_RIGHT_AXIS_X
        313  -- INPUT_REPLAY_CYCLEMARKERRIGHT
    },

    equal = {
        83 -- INPUT_VEH_NEXT_RADIO_TRACK
    },

    grave = {
        243 -- INPUT_ENTER_CHEAT_CODE
    },

    arrow_down = {
        173, -- INPUT_CELLPHONE_DOWN
        187, -- INPUT_FRONTEND_DOWN
        299  -- INPUT_REPLAY_REWIND
    },

    arrow_left = {
        174, -- INPUT_CELLPHONE_LEFT
        189, -- INPUT_FRONTEND_LEFT
        308  -- INPUT_REPLAY_BACK
    },

    arrow_right = {
        175, -- INPUT_CELLPHONE_RIGHT
        190, -- INPUT_FRONTEND_RIGHT
        307  -- INPUT_REPLAY_ADVANCE
    },

    arrow_up = {
        27,  -- INPUT_PHONE
        172, -- INPUT_CELLPHONE_UP
        188, -- INPUT_FRONTEND_UP
        300  -- INPUT_REPLAY_FFWD
    },

    backspace = {
        177, -- INPUT_CELLPHONE_CANCEL
        194, -- INPUT_FRONTEND_RRIGHT
        202  -- INPUT_FRONTEND_CANCEL
    },

    capslock = {
        137, -- INPUT_VEH_PUSHBIKE_SPRINT
        171, -- INPUT_SPECIAL_ABILITY_PC
        217  -- INPUT_FRONTEND_SELECT
    },

    delete = {
        178, -- INPUT_CELLPHONE_OPTION
        214, -- INPUT_FRONTEND_DELETE
        256, -- INPUT_CREATOR_DELETE
        296, -- INPUT_REPLAY_MARKER_DELETE
        297  -- INPUT_REPLAY_CLIP_DELETE
    },

    enter = {
        18,  -- INPUT_SKIP_CUTSCENE
        176, -- INPUT_CELLPHONE_SELECT
        191, -- INPUT_FRONTEND_RDOWN
        201, -- INPUT_FRONTEND_ACCEPT
        215  -- INPUT_FRONTEND_ENDSCREEN_ACCEPT
    },

    esc = {
        177, -- INPUT_CELLPHONE_CANCEL
        200, -- INPUT_FRONTEND_PAUSE_ALTERNATE
        202, -- INPUT_FRONTEND_CANCEL
        322  -- INPUT_REPLAY_TOGGLE_TIMELINE
    },

    f1 = {
        288 -- INPUT_REPLAY_START_STOP_RECORDING
    },

    f2 = {
        289 -- INPUT_REPLAY_START_STOP_RECORDING_SECONDARY
    },

    f3 = {
        170	-- INPUT_SAVE_REPLAY_CLIP
    },

    f5 = {
        166, -- INPUT_SELECT_CHARACTER_MICHAEL
        318, -- INPUT_REPLAY_SAVE
        327  -- INPUT_REPLAY_TIMELINE_SAVE
    },

    f6 = {
        167	-- INPUT_SELECT_CHARACTER_FRANKLIN
    },

    f7 = {
        168 -- INPUT_SELECT_CHARACTER_TREVOR
    },

    f8 = {
        169	-- INPUT_SELECT_CHARACTER_MULTIPLAYER
    },

    f9 = {
        56 -- INPUT_DROP_WEAPON
    },

    f10 = {
        57 -- INPUT_DROP_AMMO
    },

    f11 = {
        344	-- INPUT_SWITCH_VISOR
    },

    home = {
        212, -- INPUT_FRONTEND_SOCIAL_CLUB
        213  -- INPUT_FRONTEND_SOCIAL_CLUB_SECONDARY
    },

    insert = {
        121	-- INPUT_VEH_FLY_ATTACK_CAMERA
    },

    left_alt = {
        19 -- INPUT_CHARACTER_WHEEL
    },

    left_control = {
        210, -- INPUT_FRONTEND_RS
        36,  -- INPUT_DUCK
        60,  -- INPUT_VEH_MOVE_UD
        62,  -- INPUT_VEH_MOVE_DOWN_ONLY
        132, -- INPUT_VEH_SUB_DESCEND
        224, -- INPUT_SCRIPT_RLEFT
        280, -- INPUT_VEH_MOVE_UP
        281, -- INPUT_VEH_MOVE_DOWN
        326, -- INPUT_REPLAY_CTRL
        341, -- INPUT_VEH_HYDRAULICS_CONTROL_DOWN
        343  -- INPUT_VEH_HYDRAULICS_CONTROL_LR
    },

    left_mouse_button = {
        18,  -- INPUT_SKIP_CUTSCENE
        24,	 -- INPUT_ATTACK
        69,	 -- INPUT_VEH_ATTACK
        92,	 -- INPUT_VEH_PASSENGER_ATTACK
        106, -- INPUT_VEH_MOUSE_CONTROL_OVERRIDE
        122, -- INPUT_VEH_FLY_MOUSE_CONTROL_OVERRIDE
        135, -- INPUT_VEH_SUB_MOUSE_CONTROL_OVERRIDE
        142, -- INPUT_MELEE_ATTACK_ALTERNATE
        144, -- INPUT_PARACHUTE_DEPLOY
        176, -- INPUT_CELLPHONE_SELECT
        223, -- INPUT_SCRIPT_RDOWN
        229, -- INPUT_SCRIPT_RT
        237, -- INPUT_CURSOR_ACCEPT
        257, -- INPUT_ATTACK2
        329, -- INPUT_VEH_DRIVE_LOOK
        346  -- INPUT_VEH_MELEE_LEFT
    },

    left_shift = {
        21,  -- INPUT_SPRINT
        61,  -- INPUT_VEH_MOVE_UP_ONLY
        131, -- INPUT_VEH_SUB_ASCEND
        155, -- INPUT_PARACHUTE_PRECISION_LANDING
        209, -- INPUT_FRONTEND_LS
        254, -- INPUT_CREATOR_MENU_TOGGLE
        340, -- INPUT_VEH_HYDRAULICS_CONTROL_UP
        352  -- INPUT_VEH_FLY_BOOST
    },

    mouse_down = {
        2,   -- INPUT_LOOK_UD
        4,   -- INPUT_LOOK_DOWN_ONLY
        12,  -- INPUT_WEAPON_WHEEL_UD
        67,  -- INPUT_VEH_GUN_UD
        95,  -- INPUT_VEH_CINEMATIC_UD
        221, -- INPUT_SCRIPT_RIGHT_AXIS_Y
        272, -- INPUT_LOOK_UP
        273, -- INPUT_LOOK_DOWN
        291, -- INPUT_SCALED_LOOK_UD
        332  -- INPUT_RADIO_WHEEL_UD
    },

    mouse_right = {
        1,  -- INPUT_LOOK_LR
        6,  -- INPUT_LOOK_RIGHT_ONLY
        13,  -- INPUT_WEAPON_WHEEL_LR
        66,  -- INPUT_VEH_GUN_LR
        98,  -- INPUT_VEH_CINEMATIC_LR
        220, -- INPUT_SCRIPT_RIGHT_AXIS_X
        270, -- INPUT_LOOK_LEFT
        271, -- INPUT_LOOK_RIGHT
        282, -- INPUT_VEH_GUN_LEFT
        283, -- INPUT_VEH_GUN_RIGHT
        284, -- INPUT_VEH_GUN_UP
        285, -- INPUT_VEH_GUN_DOWN
        286, -- INPUT_VEH_LOOK_LEFT
        287, -- INPUT_VEH_LOOK_RIGHT
        290, -- INPUT_SCALED_LOOK_LR
        333  -- INPUT_RADIO_WHEEL_LR
    },

    numpad_hyphen = {
        96,  -- INPUT_VEH_CINEMATIC_UP_ONLY
        315  -- INPUT_REPLAY_FOVDECREASE
    },

    numpad_plus = {
        97, -- INPUT_VEH_CINEMATIC_DOWN_ONLY
        314 -- INPUT_REPLAY_FOVINCREASE
    },

    numpad_4 = {
        108, -- INPUT_VEH_FLY_ROLL_LEFT_ONLY
        124	 -- INPUT_VEH_SUB_TURN_LEFT_ONLY
    },

    numpad_5 = {
        110, -- INPUT_VEH_FLY_PITCH_UD
        112, -- INPUT_VEH_FLY_PITCH_DOWN_ONLY
        126, -- INPUT_VEH_SUB_PITCH_UD
        128, -- INPUT_VEH_SUB_PITCH_DOWN_ONLY
        110, -- INPUT_VEH_FLY_PITCH_UD
        112, -- INPUT_VEH_FLY_PITCH_DOWN_ONLY
        126, -- INPUT_VEH_SUB_PITCH_UD
        128  -- INPUT_VEH_SUB_PITCH_DOWN_ONLY
    },

    numpad_6 = {
        107, -- INPUT_VEH_FLY_ROLL_LR
        109, -- INPUT_VEH_FLY_ROLL_RIGHT_ONLY
        123, -- INPUT_VEH_SUB_TURN_LR
        125  -- INPUT_VEH_SUB_TURN_RIGHT_ONLY
    },

    numpad_7 = {
        117 -- INPUT_VEH_FLY_SELECT_TARGET_LEFT
    },

    numpad_8 = {
        111, -- INPUT_VEH_FLY_PITCH_UP_ONLY
        127	 -- INPUT_VEH_SUB_PITCH_UP_ONLY
    },

    numpad_9 = {
        118	-- INPUT_VEH_FLY_SELECT_TARGET_RIGHT
    },

    page_down = {
        11,  -- INPUT_SCRIPTED_FLY_ZDOWN
        207, -- INPUT_FRONTEND_LT
        317  -- INPUT_REPLAY_CAMERADOWN
    },

    page_up = {
        10,  -- INPUT_SCRIPTED_FLY_ZUP
        208, -- INPUT_FRONTEND_RT
        316  -- INPUT_REPLAY_CAMERAUP
    },

    right_mouse_button = {
        25,  -- INPUT_AIM
        68,  -- INPUT_VEH_AIM
        70,  -- INPUT_VEH_ATTACK2
        91,  -- INPUT_VEH_PASSENGER_AIM
        114, -- INPUT_VEH_FLY_ATTACK
        177, -- INPUT_CELLPHONE_CANCEL
        222, -- INPUT_SCRIPT_RUP
        225, -- INPUT_SCRIPT_RRIGHT
        238, -- INPUT_CURSOR_CANCEL
        330, -- INPUT_VEH_DRIVE_LOOK2
        331, -- INPUT_VEH_FLY_ATTACK2
        347  -- INPUT_VEH_MELEE_RIGHT
    },

    middle_mouse_button = {
        27, -- INPUT_PHONE
        348 -- INPUT_MAP_POI
    },

    scrollwheel_down = {
        14,  -- INPUT_WEAPON_WHEEL_NEXT
        16,  -- INPUT_SELECT_NEXT_WEAPON
        50,  -- INPUT_ACCURATE_AIM
        97,  -- INPUT_VEH_CINEMATIC_DOWN_ONLY
        180, -- INPUT_CELLPHONE_SCROLL_FORWARD
        198, -- INPUT_FRONTEND_RIGHT_AXIS_Y
        242, -- INPUT_CURSOR_SCROLL_DOWN
        262, -- INPUT_NEXT_WEAPON
        334, -- INPUT_VEH_SLOWMO_UD
        336  -- INPUT_VEH_SLOWMO_DOWN_ONLY
    },

    scrollwheel_up = {
        15,  -- INPUT_WEAPON_WHEEL_PREV
        17,  -- INPUT_SELECT_PREV_WEAPON
        96,  -- INPUT_VEH_CINEMATIC_UP_ONLY
        99,  -- INPUT_VEH_SELECT_NEXT_WEAPON
        115, -- INPUT_VEH_FLY_SELECT_NEXT_WEAPON
        181, -- INPUT_CELLPHONE_SCROLL_BACKWARD
        241, -- INPUT_CURSOR_SCROLL_UP
        261, -- INPUT_PREV_WEAPON
        335  -- INPUT_VEH_SLOWMO_UP_ONLY
    },

    spacebar = {
        18, -- INPUT_SKIP_CUTSCENE
        22,  -- INPUT_JUMP
        55,  -- INPUT_DIVE
        76,  -- INPUT_VEH_HANDBRAKE
        102, -- INPUT_VEH_JUMP
        143, -- INPUT_MELEE_BLOCK
        179, -- INPUT_CELLPHONE_EXTRA_OPTION
        203, -- INPUT_FRONTEND_X
        216, -- INPUT_FRONTEND_ENDSCREEN_EXPAND
        255, -- INPUT_CREATOR_ACCEPT
        298, -- INPUT_REPLAY_PAUSE
        321, -- INPUT_REPLAY_PREVIEW
        328, -- INPUT_REPLAY_PREVIEW_AUDIO
        353  -- INPUT_VEH_PARACHUTE
    },

    tab = {
        37,  -- INPUT_SELECT_WEAPON
        192, -- INPUT_FRONTEND_RUP
        204, -- INPUT_FRONTEND_Y
        211, -- INPUT_FRONTEND_LEADERBOARD
        349  -- INPUT_REPLAY_SNAPMATIC_PHOTO
    },

    respawn = {
        359  -- INPUT_RESPAWN_FASTER
    }
}

key.close_square_bracket = key.right_square_bracket
key.right_bracket        = key.right_square_bracket
key.close_bracket        = key.right_square_bracket

key.open_square_bracket  = key.left_square_bracket
key.open_bracket         = key.left_square_bracket
key.left_bracket         = key.left_square_bracket

key.middle_click         = key.middle_mouse_button
key.right_click          = key.right_mouse_button
key.scroll_down          = key.scrollwheel_down
key.left_click           = key.left_mouse_button
key.scroll_up            = key.scrollwheel_up
key.left_ctrl            = key.left_control

key.down                 = key.arrow_down
key.right                = key.arrow_right
key.left                 = key.arrow_left
key.up                   = key.arrow_up

key.num_hyphen           = key.numpad_hyphen
key.num_plus             = key.numpad_plus
key.num_4                = key.numpad_4
key.num_5                = key.numpad_5
key.num_6                = key.numpad_6
key.num_7                = key.numpad_7
key.num_8                = key.numpad_8
key.num_9                = key.numpad_9

key.space                = key.spacebar