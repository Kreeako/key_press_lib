--  ╔════════════════════════════════════════════════════════════════════════╗
--  ║                                                                        ║
--  ║    To use this script you can do something like this in your script:   ║
--  ║    local key = require("key_press_lib")                                ║
--  ║                                                                        ║
--  ║    Then you can do key.spacebar to access the spacebar keygroup.       ║
--  ║                                                                        ║
--  ╚════════════════════════════════════════════════════════════════════════╝

local nv = native_invoker

local function set_key(padIndex, control, amount)
    nv.begin_call()
    nv.push_arg_int(padIndex)
    nv.push_arg_int(control)
    nv.push_arg_float(amount)
    nv.end_call_2(0xE8A25867FBA3B05E)
    return nv.get_return_value_bool()
end

---For setting cursor position.
---@param x integer --The horizontal position you want to set (0-100).
---@param y integer --The vertical position you want to set (0-100).
---@return unknown
local function _set_cursor_position_function(x, y)
    nv.begin_call()
    nv.push_arg_float(x / 100)
    nv.push_arg_float(y / 100)
    nv.end_call_2(0xFC695459D4D0E219)
    return nv.get_return_value_bool()
end

---For pressing a single 
---@param key integer --The key you would like to press,for example: spacebar[2]
---@param num integer --The number of times you would like to press the 
---@param yield integer --The number of milliseconds you would like to delay after each key release.
local function _press_key_function(key, num, yield)
    for i = 0,num - 1 do
        set_key(2,key,1)
        util.yield()
        set_key(2,key,0)
        util.yield(yield)
    end
end

---For pressing a whole keygroup.
---@param keygroup table --The keygroup you would like to press,for example: spacebar
---@param num integer --The number of times you would like to press the 
---@param yield integer --The number of milliseconds you would like to delay after each key release.
local function _press_keygroup_function(keygroup, num, yield)
    if keygroup == nil then
        util.toast("Keygroup nil.")
        util.log("Keygroup nil.")
        return
    end

    for i = 0,num - 1 do
        for index,key in ipairs(keygroup) do
            set_key(2,key,1)
            util.yield()
            set_key(2,key,0)
        end
        util.yield(yield)
    end
end

return {
    a = {
        INPUT_MOVE_LEFT_ONLY = 34,
        INPUT_VEH_MOVE_LEFT_ONLY = 63,
        INPUT_VEH_FLY_YAW_LEFT = 89,
        INPUT_VEH_SUB_TURN_HARD_LEFT = 133,
        INPUT_PARACHUTE_TURN_LEFT_ONLY = 147,
        INPUT_SCRIPT_PAD_LEFT = 234,
        INPUT_VEH_HYDRAULICS_CONTROL_LEFT = 338
    },

    b = {
        INPUT_SPECIAL_ABILITY_SECONDARY = 29,
        INPUT_REPLAY_STARTPOINT = 305
    },

    c = {
        INPUT_LOOK_BEHIND = 26,
        INPUT_VEH_LOOK_BEHIND = 79,
        INPUT_CREATOR_RT = 253,
        INPUT_REPLAY_TOGGLETIME = 319,
        INPUT_REPLAY_TIMELINE_DUPLICATE_CLIP = 324
    },

    d = {
        INPUT_SCRIPTED_FLY_LR = 9,
        INPUT_MOVE_LR = 30,
        INPUT_MOVE_RIGHT_ONLY = 35,
        INPUT_VEH_MOVE_LR = 59,
        INPUT_VEH_MOVE_RIGHT_ONLY = 64,
        INPUT_VEH_FLY_YAW_RIGHT = 90,
        INPUT_VEH_SUB_TURN_HARD_RIGHT = 134,
        INPUT_PARACHUTE_TURN_LR = 146,
        INPUT_PARACHUTE_TURN_RIGHT_ONLY = 148,
        INPUT_FRONTEND_AXIS_X = 195,
        INPUT_SCRIPT_LEFT_AXIS_X = 218,
        INPUT_SCRIPT_PAD_RIGHT = 235,
        INPUT_MOVE_LEFT = 266,
        INPUT_MOVE_RIGHT = 267,
        INPUT_VEH_MOVE_LEFT = 278,
        INPUT_VEH_MOVE_RIGHT = 279,
        INPUT_VEH_HYDRAULICS_CONTROL_RIGHT = 339,
        INPUT_VEH_HYDRAULICS_CONTROL_UD = 342
    },

    e = {
        INPUT_PICKUP = 38,
        INPUT_TALK = 46,
        INPUT_CONTEXT = 51,
        INPUT_WEAPON_SPECIAL_TWO = 54,
        INPUT_VEH_HORN = 86,
        INPUT_VEH_GRAPPLING_HOOK = 103,
        INPUT_VEH_FLY_VERTICAL_FLIGHT_MODE = 119,
        INPUT_PARACHUTE_BRAKE_RIGHT = 153,
        INPUT_CELLPHONE_CAMERA_SELFIE = 184,
        INPUT_FRONTEND_RB = 206,
        INPUT_VEH_CAR_JUMP = 350,
        INPUT_VEH_ROCKET_BOOST = 351,
        INPUT_VEH_FLY_BOMB_BAY = 355,
        INPUT_VEH_FLY_COUNTER = 356
    },

    f = {
        INPUT_ENTER = 23,
        INPUT_ARREST = 49,
        INPUT_VEH_EXIT = 75,
        INPUT_PARACHUTE_DETACH = 145,
        INPUT_CELLPHONE_CAMERA_DOF = 185,
        INPUT_CREATOR_RS = 251,
        INPUT_PARACHUTE_DEPLOY = 144
    },

    g = {
        INPUT_DETONATE = 47,
        INPUT_THROW_GRENADE = 58,
        INPUT_VEH_FLY_UNDERCARRIAGE = 113,
        INPUT_CELLPHONE_CAMERA_GRID = 183
    },

    h = {
        INPUT_VEH_HEADLIGHT = 74,
        INPUT_VEH_ROOF = 101,
        INPUT_VEH_SHUFFLE = 104,
        INPUT_REPLAY_HIDEHUD = 304
    },

    k = {
        INPUT_REPLAY_SHOWHOTKEY = 311
    },

    l = {
        INPUT_CELLPHONE_CAMERA_FOCUS_LOCK = 182
    },

    m = {
        INPUT_INTERACTION_MENU = 244,
        INPUT_REPLAY_NEWMARKER = 301
    },

    n = {
        INPUT_PUSH_TO_TALK = 249,
        INPUT_REPLAY_ENDPOINT = 306
    },

    p = {
        INPUT_FRONTEND_PAUSE = 199
    },

    q = {
        INPUT_COVER = 44,
        INPUT_CONTEXT_SECONDARY = 52,
        INPUT_VEH_RADIO_WHEEL = 85,
        INPUT_VEH_PUSHBIKE_FRONT_BRAKE = 138,
        INPUT_MELEE_ATTACK_HEAVY = 141,
        INPUT_PARACHUTE_BRAKE_LEFT = 152,
        INPUT_FRONTEND_LB = 205,
        INPUT_MELEE_ATTACK2 = 264
    },

    r = {
        INPUT_RELOAD = 45,
        INPUT_VEH_CIN_CAM = 80,
        INPUT_MELEE_ATTACK_LIGHT = 140,
        INPUT_CREATOR_LS = 250,
        INPUT_MELEE_ATTACK1 = 263,
        INPUT_REPLAY_RESTART = 310
    },

    s = {
        INPUT_SCRIPTED_FLY_UD = 8,
        INPUT_MOVE_UD = 31,
        INPUT_MOVE_DOWN_ONLY = 33,
        INPUT_VEH_BRAKE = 72,
        INPUT_VEH_HOTWIRE_RIGHT = 78,
        INPUT_VEH_FLY_THROTTLE_DOWN = 88,
        INPUT_VEH_SUB_THROTTLE_DOWN = 130,
        INPUT_VEH_PUSHBIKE_REAR_BRAKE = 139,
        INPUT_PARACHUTE_PITCH_UD = 149,
        INPUT_PARACHUTE_PITCH_DOWN_ONLY = 151,
        INPUT_FRONTEND_AXIS_Y = 196,
        INPUT_SCRIPT_LEFT_AXIS_Y = 219,
        INPUT_SCRIPT_PAD_DOWN = 233,
        INPUT_MOVE_UP = 268,
        INPUT_MOVE_DOWN = 269,
        INPUT_REPLAY_RECORD = 302
    },

    t = {
        INPUT_MP_TEXT_CHAT_ALL = 245,
        INPUT_REPLAY_TOOLS = 309
    },

    u = {
        INPUT_REPLAY_SCREENSHOT = 303
    },

    v = {
        INPUT_NEXT_CAMERA = 0,
        INPUT_SCRIPT_SELECT = 236,
        INPUT_REPLAY_TOGGLETIPS = 320,
        INPUT_REPLAY_TIMELINE_PLACE_CLIP = 325
    },

    w = {
        INPUT_MOVE_UP_ONLY = 32,
        INPUT_VEH_ACCELERATE = 71,
        INPUT_VEH_HOTWIRE_LEFT = 77,
        INPUT_VEH_FLY_THROTTLE_UP = 87,
        INPUT_VEH_SUB_THROTTLE_UP = 129,
        INPUT_VEH_PUSHBIKE_PEDAL = 136,
        INPUT_PARACHUTE_PITCH_UP_ONLY = 150,
        INPUT_SCRIPT_PAD_UP = 232
    },

    x = {
        INPUT_VEH_DUCK = 73,
        INPUT_VEH_DROP_PROJECTILE = 105,
        INPUT_VEH_FLY_DUCK = 120,
        INPUT_PARACHUTE_SMOKE = 154,
        INPUT_CELLPHONE_CAMERA_EXPRESSION = 186,
        INPUT_CREATOR_LT = 252,
        INPUT_REPLAY_TIMELINE_PICKUP_CLIP = 323,
        INPUT_VEH_HYDRAULICS_CONTROL_TOGGLE = 337,
        INPUT_VEH_MELEE_HOLD = 345,
        INPUT_VEH_BIKE_WINGS = 354,
        INPUT_VEH_TRANSFORM = 357
    },

    y = {
        INPUT_MP_TEXT_CHAT_TEAM = 246
    },

    z = {
        INPUT_MULTIPLAYER_INFO = 20,
        INPUT_HUD_SPECIAL = 48
    },

    number_1 = {
        INPUT_SELECT_WEAPON_UNARMED = 157
    },

    number_2 = {
        INPUT_SELECT_WEAPON_MELEE = 158
    },

    number_3 = {
        INPUT_SELECT_WEAPON_SHOTGUN = 160
    },

    number_4 = {
        INPUT_SELECT_WEAPON_HEAVY = 164
    },

    number_5 = {
        INPUT_SELECT_WEAPON_SPECIAL = 165
    },

    number_6 = {
        INPUT_SELECT_WEAPON_HANDGUN = 159
    },

    number_7 = {
        INPUT_SELECT_WEAPON_SMG = 161
    },

    number_8 = {
        INPUT_SELECT_WEAPON_AUTO_RIFLE = 162
    },

    number_9 = {
        INPUT_SELECT_WEAPON_SNIPER = 163
    },

    hyphen = {
        INPUT_VEH_PREV_RADIO_TRACK = 84
    },

    comma = {
        INPUT_VEH_PREV_RADIO = 82
    },

    period = {
        INPUT_VEH_NEXT_RADIO = 81
    },

    left_square_bracket = {
        INPUT_SNIPER_ZOOM = 39,
        INPUT_SNIPER_ZOOM_OUT_ONLY = 41,
        INPUT_SNIPER_ZOOM_OUT_SECONDARY = 43,
        INPUT_VEH_SELECT_PREV_WEAPON = 100,
        INPUT_VEH_FLY_SELECT_PREV_WEAPON = 116,
        INPUT_SNIPER_ZOOM_IN = 274,
        INPUT_SNIPER_ZOOM_OUT = 275,
        INPUT_SNIPER_ZOOM_IN_ALTERNATE = 276,
        INPUT_SNIPER_ZOOM_OUT_ALTERNATE = 277,
        INPUT_REPLAY_CYCLEMARKERLEFT = 312
    },

    right_square_bracket = {
        INPUT_SNIPER_ZOOM_IN_ONLY = 40,
        INPUT_SNIPER_ZOOM_IN_SECONDARY = 42,
        INPUT_FRONTEND_RIGHT_AXIS_X = 197,
        INPUT_REPLAY_CYCLEMARKERRIGHT = 313
    },

    equal = {
        INPUT_VEH_NEXT_RADIO_TRACK = 83
    },

    grave = {
        INPUT_ENTER_CHEAT_CODE = 243
    },

    arrow_down = {
        INPUT_CELLPHONE_DOWN = 173,
        INPUT_FRONTEND_DOWN = 187,
        INPUT_REPLAY_REWIND = 299
    },

    arrow_left = {
        INPUT_CELLPHONE_LEFT = 174,
        INPUT_FRONTEND_LEFT = 189,
        INPUT_REPLAY_BACK = 308
    },

    arrow_right = {
        INPUT_CELLPHONE_RIGHT = 175,
        INPUT_FRONTEND_RIGHT = 190,
        INPUT_REPLAY_ADVANCE = 307
    },

    arrow_up = {
        INPUT_PHONE = 27,
        INPUT_CELLPHONE_UP = 172,
        INPUT_FRONTEND_UP = 188,
        INPUT_REPLAY_FFWD = 300
    },

    backspace = {
        INPUT_CELLPHONE_CANCEL = 177,
        INPUT_FRONTEND_RRIGHT = 194,
        INPUT_FRONTEND_CANCEL = 202
    },

    capslock = {
        INPUT_VEH_PUSHBIKE_SPRINT = 137,
        INPUT_SPECIAL_ABILITY_PC = 171,
        INPUT_FRONTEND_SELECT = 217
    },

    delete = {
        INPUT_CELLPHONE_OPTION = 178,
        INPUT_FRONTEND_DELETE = 214,
        INPUT_CREATOR_DELETE = 256,
        INPUT_REPLAY_MARKER_DELETE = 296,
        INPUT_REPLAY_CLIP_DELETE = 297
    },

    enter = {
        INPUT_SKIP_CUTSCENE = 18,
        INPUT_CELLPHONE_SELECT = 176,
        INPUT_FRONTEND_RDOWN = 191,
        INPUT_FRONTEND_ACCEPT = 201,
        INPUT_FRONTEND_ENDSCREEN_ACCEPT = 215
    },

    esc = {
        INPUT_CELLPHONE_CANCEL = 177,
        INPUT_FRONTEND_PAUSE_ALTERNATE = 200,
        INPUT_FRONTEND_CANCEL = 202,
        INPUT_REPLAY_TOGGLE_TIMELINE = 322
    },

    f1 = {
        INPUT_REPLAY_START_STOP_RECORDING = 288
    },

    f2 = {
        INPUT_REPLAY_START_STOP_RECORDING_SECONDARY = 289
    },

    f3 = {
        INPUT_SAVE_REPLAY_CLIP = 170
    },

    f5 = {
        INPUT_SELECT_CHARACTER_MICHAEL = 166,
        INPUT_REPLAY_SAVE = 318,
        INPUT_REPLAY_TIMELINE_SAVE = 327
    },

    f6 = {
        INPUT_SELECT_CHARACTER_FRANKLIN = 167
    },

    f7 = {
        INPUT_SELECT_CHARACTER_TREVOR = 168
    },

    f8 = {
        INPUT_SELECT_CHARACTER_MULTIPLAYER = 169
    },

    f9 = {
        INPUT_DROP_WEAPON = 56
    },

    f10 = {
        INPUT_DROP_AMMO = 57
    },

    f11 = {
        INPUT_SWITCH_VISOR = 344
    },

    home = {
        INPUT_FRONTEND_SOCIAL_CLUB = 212,
        INPUT_FRONTEND_SOCIAL_CLUB_SECONDARY = 213 
    },

    insert = {
        INPUT_VEH_FLY_ATTACK_CAMERA = 121
    },

    left_alt = {
        INPUT_CHARACTER_WHEEL = 19
    },

    left_control = {
        INPUT_FRONTEND_RS = 210,
        INPUT_DUCK = 36,
        INPUT_VEH_MOVE_UD = 60,
        INPUT_VEH_MOVE_DOWN_ONLY = 62,
        INPUT_VEH_SUB_DESCEND = 132,
        INPUT_SCRIPT_RLEFT = 224,
        INPUT_VEH_MOVE_UP = 280,
        INPUT_VEH_MOVE_DOWN = 281,
        INPUT_REPLAY_CTRL = 326,
        INPUT_VEH_HYDRAULICS_CONTROL_DOWN = 341,
        INPUT_VEH_HYDRAULICS_CONTROL_LR = 343
    },

    left_mouse_button = {
        INPUT_SKIP_CUTSCENE = 18,
        INPUT_ATTACK = 24,
        INPUT_VEH_ATTACK = 69,
        INPUT_VEH_PASSENGER_ATTACK = 92,
        INPUT_VEH_MOUSE_CONTROL_OVERRIDE = 106,
        INPUT_VEH_FLY_MOUSE_CONTROL_OVERRIDE = 122,
        INPUT_VEH_SUB_MOUSE_CONTROL_OVERRIDE = 135,
        INPUT_MELEE_ATTACK_ALTERNATE = 142,
        INPUT_PARACHUTE_DEPLOY = 144,
        INPUT_CELLPHONE_SELECT = 176,
        INPUT_SCRIPT_RDOWN = 223,
        INPUT_SCRIPT_RT = 229,
        INPUT_CURSOR_ACCEPT = 237,
        INPUT_ATTACK2 = 257,
        INPUT_VEH_DRIVE_LOOK = 329,
        INPUT_VEH_MELEE_LEFT = 346
    },

    left_shift = {
        INPUT_SPRINT = 21,
        INPUT_VEH_MOVE_UP_ONLY = 61,
        INPUT_VEH_SUB_ASCEND = 131,
        INPUT_PARACHUTE_PRECISION_LANDING = 155,
        INPUT_FRONTEND_LS = 209,
        INPUT_CREATOR_MENU_TOGGLE = 254,
        INPUT_VEH_HYDRAULICS_CONTROL_UP = 340,
        INPUT_VEH_FLY_BOOST = 352
    },

    mouse_down = {
        INPUT_LOOK_UD = 2,
        INPUT_LOOK_DOWN_ONLY = 4,
        INPUT_WEAPON_WHEEL_UD = 12,
        INPUT_VEH_GUN_UD = 67,
        INPUT_VEH_CINEMATIC_UD = 95,
        INPUT_SCRIPT_RIGHT_AXIS_Y = 221,
        INPUT_LOOK_UP = 272,
        INPUT_LOOK_DOWN = 273,
        INPUT_SCALED_LOOK_UD = 291,
        INPUT_RADIO_WHEEL_UD = 332
    },

    mouse_right = {
        INPUT_LOOK_LR = 1,
        INPUT_LOOK_RIGHT_ONLY = 6,
        INPUT_WEAPON_WHEEL_LR = 13,
        INPUT_VEH_GUN_LR = 66,
        INPUT_VEH_CINEMATIC_LR = 98,
        INPUT_SCRIPT_RIGHT_AXIS_X = 220,
        INPUT_LOOK_LEFT = 270,
        INPUT_LOOK_RIGHT = 271,
        INPUT_VEH_GUN_LEFT = 282,
        INPUT_VEH_GUN_RIGHT = 283,
        INPUT_VEH_GUN_UP = 284,
        INPUT_VEH_GUN_DOWN = 285,
        INPUT_VEH_LOOK_LEFT = 286,
        INPUT_VEH_LOOK_RIGHT = 287,
        INPUT_SCALED_LOOK_LR = 290,
        INPUT_RADIO_WHEEL_LR = 333
    },

    numpad_hyphen = {
        INPUT_VEH_CINEMATIC_UP_ONLY = 96,
        INPUT_REPLAY_FOVDECREASE = 315
    },

    numpad_plus = {
        INPUT_VEH_CINEMATIC_DOWN_ONLY = 97,
        INPUT_REPLAY_FOVINCREASE = 314
    },

    numpad_4 = {
        INPUT_VEH_FLY_ROLL_LEFT_ONLY = 108,
        INPUT_VEH_SUB_TURN_LEFT_ONLY = 124
    },

    numpad_5 = {
        INPUT_VEH_FLY_PITCH_UD_ = 110,
        INPUT_VEH_FLY_PITCH_DOWN_ONLY_ = 112,
        INPUT_VEH_SUB_PITCH_UD_ = 126,
        INPUT_VEH_SUB_PITCH_DOWN_ONLY_ = 128,
        INPUT_VEH_FLY_PITCH_UD = 110,
        INPUT_VEH_FLY_PITCH_DOWN_ONLY = 112,
        INPUT_VEH_SUB_PITCH_UD = 126,
        INPUT_VEH_SUB_PITCH_DOWN_ONLY = 128
    },

    numpad_6 = {
        INPUT_VEH_FLY_ROLL_LR = 107,
        INPUT_VEH_FLY_ROLL_RIGHT_ONLY = 109,
        INPUT_VEH_SUB_TURN_LR = 123,
        INPUT_VEH_SUB_TURN_RIGHT_ONLY = 125
    },

    numpad_7 = {
        INPUT_VEH_FLY_SELECT_TARGET_LEFT = 117
    },

    numpad_8 = {
        INPUT_VEH_FLY_PITCH_UP_ONLY = 111,
        INPUT_VEH_SUB_PITCH_UP_ONLY = 127
    },

    numpad_9 = {
        INPUT_VEH_FLY_SELECT_TARGET_RIGHT = 118
    },

    page_down = {
        INPUT_SCRIPTED_FLY_ZDOWN = 11,
        INPUT_FRONTEND_LT = 207,
        INPUT_REPLAY_CAMERADOWN = 317
    },

    page_up = {
        INPUT_SCRIPTED_FLY_ZUP = 10,
        INPUT_FRONTEND_RT = 208,
        INPUT_REPLAY_CAMERAUP = 316
    },

    right_mouse_button = {
        INPUT_AIM = 25,
        INPUT_VEH_AIM = 68,
        INPUT_VEH_ATTACK2 = 70,
        INPUT_VEH_PASSENGER_AIM = 91,
        INPUT_VEH_FLY_ATTACK = 114,
        INPUT_CELLPHONE_CANCEL = 177,
        INPUT_SCRIPT_RUP = 222,
        INPUT_SCRIPT_RRIGHT = 225,
        INPUT_CURSOR_CANCEL = 238,
        INPUT_VEH_DRIVE_LOOK2 = 330,
        INPUT_VEH_FLY_ATTACK2 = 331,
        INPUT_VEH_MELEE_RIGHT = 347
    },

    middle_mouse_button = {
        INPUT_PHONE = 27,
        INPUT_MAP_POI = 348
    },

    scrollwheel_down = {
        INPUT_WEAPON_WHEEL_NEXT = 14,
        INPUT_SELECT_NEXT_WEAPON = 16,
        INPUT_ACCURATE_AIM = 50,
        INPUT_VEH_CINEMATIC_DOWN_ONLY = 97,
        INPUT_CELLPHONE_SCROLL_FORWARD = 180,
        INPUT_FRONTEND_RIGHT_AXIS_Y = 198,
        INPUT_CURSOR_SCROLL_DOWN = 242,
        INPUT_NEXT_WEAPON = 262,
        INPUT_VEH_SLOWMO_UD = 334,
        INPUT_VEH_SLOWMO_DOWN_ONLY = 336
    },

    scrollwheel_up = {
        INPUT_WEAPON_WHEEL_PREV = 15,
        INPUT_SELECT_PREV_WEAPON = 17,
        INPUT_VEH_CINEMATIC_UP_ONLY = 96,
        INPUT_VEH_SELECT_NEXT_WEAPON = 99,
        INPUT_VEH_FLY_SELECT_NEXT_WEAPON = 115,
        INPUT_CELLPHONE_SCROLL_BACKWARD = 181,
        INPUT_CURSOR_SCROLL_UP = 241,
        INPUT_PREV_WEAPON = 261,
        INPUT_VEH_SLOWMO_UP_ONLY = 335
    },

    spacebar = {
        INPUT_SKIP_CUTSCENE = 18,
        INPUT_JUMP = 22,
        INPUT_DIVE = 55,
        INPUT_VEH_HANDBRAKE = 76,
        INPUT_VEH_JUMP = 102,
        INPUT_MELEE_BLOCK = 143,
        INPUT_CELLPHONE_EXTRA_OPTION = 179,
        INPUT_FRONTEND_X = 203,
        INPUT_FRONTEND_ENDSCREEN_EXPAND = 216,
        INPUT_CREATOR_ACCEPT = 255,
        INPUT_REPLAY_PAUSE = 298,
        INPUT_REPLAY_PREVIEW = 321,
        INPUT_REPLAY_PREVIEW_AUDIO = 328,
        INPUT_VEH_PARACHUTE = 353
    },

    tab = {
        INPUT_SELECT_WEAPON = 37,
        INPUT_FRONTEND_RUP = 192,
        INPUT_FRONTEND_Y = 204,
        INPUT_FRONTEND_LEADERBOARD = 211,
        INPUT_REPLAY_SNAPMATIC_PHOTO = 349
    },

    respawn = {
        INPUT_RESPAWN_FASTER = 359
    },

    set_cursor_position =_set_cursor_position_function,
    press_key = _press_key_function,
    press_keygroup = _press_keygroup_function
}