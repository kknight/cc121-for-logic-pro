--
-- Globals
--
PORT_IN = 'Port1'
PORT_OUT = 'Port1'

local MODE = {
    -- AI section modes
    ai = 'AI',
    jog = 'Jog',

    -- e-Button rotation modes
    viewAuto = 'Auto',
    viewFlex = 'Flex',
    viewOff = 'Off',

    -- EQ banks
    eqBank1 = 'EQ1',
    eqBank2 = 'EQ2',
}

--
-- Constants
--

-- MIDI Note numbers (buttons)
NOTE = {
    RECORD_ARM = 0x00,
    SOLO = 0x08,
    MUTE = 0x10,
    CHANNEL_SELECT_LEFT = 0x30,
    CHANNEL_SELECT_RIGHT = 0x31,
    E_BUTTON = 0x33,
    FUNCTION1 = 0x36,
    FUNCTION2 = 0x37,
    FUNCTION3 = 0x38,
    FUNCTION4 = 0x39,
    VALUE_ENCODER_BUTTON = 0x3A,
    FOOTSWITCH = 0x3B,
    AUTOMATION_READ = 0x4A,
    AUTOMATION_WRITE = 0x4B,
    LOOP = 0x56,
    TO_START = 0x58,
    TO_END = 0x5A,
    REWIND = 0x5B,
    FORWARD = 0x5C,
    STOP = 0x5D,
    PLAY = 0x5E,
    RECORD = 0x5F,
    FADER_TOUCH = 0x68,
    EQ_ENABLE1 = 0x70,
    EQ_ENABLE2 = 0x71,
    EQ_ENABLE3 = 0x72,
    EQ_ENABLE4 = 0x73,
    EQ_TYPE = 0x74,
    ALL_BYPASS = 0x75,
    JOG = 0x76,
    LOCK = 0x77,
    INPUT_MONITOR = 0x78,
    OPEN_VSTI = 0x79
}

-- MIDI CC numbers (knobs / encoders)
CC = {
    PAN = 0x10,
    EQ_Q1 = 0x20,
    EQ_Q2 = 0x21,
    EQ_Q3 = 0x22,
    EQ_Q4 = 0x23,
    EQ_FREQUENCY1 = 0x30,
    EQ_FREQUENCY2 = 0x31,
    EQ_FREQUENCY3 = 0x32,
    EQ_FREQUENCY4 = 0x33,
    EQ_GAIN1 = 0x40,
    EQ_GAIN2 = 0x41,
    EQ_GAIN3 = 0x42,
    EQ_GAIN4 = 0x43,
    VALUE = 0x50,
    AI_KNOB = 0x3C
}

KEYCMD = {
    -- Transport
    LOOP = 15,
    REWIND = 10,
    FORWARD = 11,
    STOP = 5,
    PLAY = 3,
    RECORD = 7,
    PLAY_TOGGLE = 535,
    PLAY_STOP_RETURN = 1270,
    RECORD_TOGGLE = 2,
    OVERDUB = 20,
    AUTO_PUNCH = 16,

    -- Locators
    SET_L = 507,
    SET_R = 508,
    GOTO_L = 480,
    GOTO_R = 481,
    GOTO_START = 1222,
    GOTO_END = 1241,

    -- Loop / cycle
    CYCLE = 15,
    PRE_COUNT = 1291,
    LOOP_BACK = 700,
    LOOP_FWD = 699,
    LOOP_SELECTION = 100,

    -- Track selection
    TRACK_LEFT = 1272,
    TRACK_RIGHT = 1273,
    PREV_PATCH = 1213,
    NEXT_PATCH = 1212,
    PREV_CHANNEL_SETTING = 1215,
    NEXT_CHANNEL_SETTING = 1214,

    -- Markers
    PREV_MARKER = 1330,
    NEXT_MARKER = 1329,
    ADD_MARKER = 513,
    DELETE_MARKER = 514,

    -- Workflow
    CLICK = 474,
    UNDO = 761,
    REDO = 796,
    TAP_TEMPO = 532,
    CAPTURE_MIDI = 542,
    PLAY_SELECTION = 544,

    -- Quantize
    QUANTIZE = 110,
    UNDO_QUANTIZE = 381,
    QUANTIZE_SELECTION = 965,

    -- Views
    TOGGLE_BROWSE = 749,
    TOGGLE_INST = 2397,
    TOGGLE_MIXER = 735,
    TOGGLE_SMART = 1296,
    TOGGLE_LOOPS = 748,

    -- Plug-ins
    PLUG_INS = 1255,
    TOGGLE_ALL_PLUGINS = 1255,
    CLOSE_ALL_PLUGINS = 1366,
    OPEN_INSERT1 = 2454,
    BYPASS_ALL = 1248,

    -- Zoom
    ZOOM_IN = 42,
    ZOOM_OUT = 41,
    ZOOM_IN_V = 44,
    ZOOM_OUT_V = 43,
    REWIND_BY_NUDGE = 2594,
    FORWARD_BY_NUDGE = 2595,

    -- Track controls
    ARP = 1237,
    ARM = 593,
    MUTE = 1231,
    SOLO = 1232,
    ALL_ARM_OFF = 1042,
    ALL_MUTE_OFF = 1041,
    TOGGLE_ALL_SOLO = 1040,
    LEARN = 3096,

    -- Automation
    VIEW_AUTOMATION = 116,
    VIEW_FLEX = 1753,
    AUTO = 1015,
    AUTO_SELECT = 1378,
    AUTO_MONITORING = 694,
    ADD_AUTOMATION = 2257,

    -- Clips / Scenes
    CLIP_RECORD = 1334,
    CLIPS_VIEW = 1376,
    LAUNCHER_VIEW = 1394,
    ARRANGER_VIEW = 1395,
    TRIGGER_SELECTED_CLIP = 2577,
    CREATE_CLIP = 149,
    CREATE_SCENE = 2808,
    PREV_SCENE = 2700,
    NEXT_SCENE = 2701,
    TRIGGER_SELECTED_SCENE = 2807,
    PERFORMANCE_RECORD = 2800,
    STOP_ALL_CLIPS = 2593,
    RETURN_TO_ARRANGER = 1337,
    CREATE_SCENE_FROM_CLIPS = 2809,
    CREATE_SCENE_FROM_LOOP = 1398,

    -- Edit
    CUT = 762,
    COPY = 763,
    PASTE = 764,
    DELETE = 765,

    -- Misc
    VIEW_SENDS = 2047,
    INC_LAST_PARAM_BY1 = 879,
    DEC_LAST_PARAM_BY1 = 880,
    INC_LAST_PARAM_BY10 = 881,
    DEC_LAST_PARAM_BY10 = 882,
}

TRACKPARAM = {
    INPUT_MON = 266 -- Toggle input monitor
}

----------------------------------------------------------------
-- Bound plugin identifiers for use with CS_BOUNDPLUGINPAR1
--
-- Usage:
--   { control = 'X', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1,
--     paramOffset = N, boundManuf = BOUND_MANUF.EMAG,
--     boundSubID = 0,  boundPlugInID = BOUND_ID.CHANNEL_EQ }
--
-- For third-party AUs, boundSubID and boundPlugInID come from:
--   auval -a | grep 'Plugin Name'
--   output: TYPE  SUBTYPE  MANUF
--   boundManuf = 'MANUF', boundSubID = 'TYPE', boundPlugInID = 'SUBTYPE'
----------------------------------------------------------------

-- Manufacturer codes
BOUND_MANUF = {
    EMAG = 'EMAG',   -- Emagic/Logic native (old)
    CLEM = 'CLEM',   -- Logic native (newer)
    APPL = 'appl',   -- Apple standard AU
}

-- boundPlugInID values for Logic-native EMAG plugins
-- boundSubID = 0 for all of these
BOUND_ID = {
    -- Channel strip effects
    CHANNEL_EQ          = 236,

    -- Synthesizers (Emagic era)
    ES1                 = 189,
    ES_M                = 201,
    ES_P                = 202,
    ES_E                = 203,
    ES2                 = 214,
    EFM1                = 219,
    EVOC_20_PS          = 220,
    SCULPTURE           = 222,

    -- Vintage instruments
    VINTAGE_ELECTRIC_PIANO = 213,
    VINTAGE_B3_ORGAN    = 216,
    VINTAGE_CLAV        = 223,

    -- Modern instruments
    RETRO_SYNTH         = 279,
    DRUM_SYNTH          = 281,
    ULTRABEAT           = 238,
    ALCHEMY             = 313,
}

-- boundPlugInID values for Logic-native CLEM plugins
-- boundSubID = 0 unless noted
BOUND_ID_CLEM = {
    DRUM_KIT_DESIGNER   = 1095650636,   -- 'ANML'
    EXS24               = 1396788529,   -- 'SAM1'
    SAMPLER             = 1396788529,   -- 'SAM1' (same as EXS24)
    QUICK_SAMPLER       = 1347375956,   -- 'PRRT'
    -- Mellotron/Studio Strings/Horns share plugInID, differ by boundSubID
    VINTAGE_MELLOTRON   = 1231968114,   -- 'InWr', boundSubID = 1
    STUDIO_STRINGS      = 1231968114,   -- 'InWr', boundSubID = 2
    STUDIO_HORNS        = 1231968114,   -- 'InWr', boundSubID = 3
}

function dumpGlobals()
    local result = ""
    for k, v in pairs(_G) do
        local vtype = type(v)
        if vtype == "number" or vtype == "string" or vtype == "boolean" then
            result = result .. k .. "=" .. tostring(v) .. "\n"
        elseif vtype == "table" then
            result = result .. k .. "=(table)\n"
        elseif vtype == "function" then
            result = result .. k .. "=(function)\n"
        end
    end
    print(result)
end

dumpGlobals()

--
-- Control IDs
--
local kControlIDFader = 0
local kControlIDPan = 1
local kControlIDMute = 2
local kControlIDSolo = 3
local kControlIDInputMonitor = 4
local kControlIDRecArm = 5
local kControlIDRead = 6
local kControlIDWrite = 7
local kControlIDChanLeft = 8
local kControlIDChanRight = 9
local kControlIDPlay = 10
local kControlIDStop = 11
local kControlIDRecord = 12
local kControlIDLoop = 13
local kControlIDJog = 14
local kControlIDAI = 15
local kControlIDE = 16
local kControlIDVst = 17
local kControlIDLoQQ = 18
local kControlIDLoFreq = 19
local kControlIDLoGain = 20
local kControlIDLoEnable = 21
local kControlIDLoMidQQ = 22
local kControlIDLoMidFreq = 23
local kControlIDLoMidGain = 24
local kControlIDLoMidEnable = 25
local kControlIDHiMidQQ = 26
local kControlIDHiMidFreq = 27
local kControlIDHiMidGain = 28
local kControlIDHiMidEnable = 29
local kControlIDHiQQ = 30
local kControlIDHiFreq = 31
local kControlIDHiGain = 32
local kControlIDHiEnable = 33
local kControlIDEqType = 34
local kControlIDToStart = 35
local kControlIDToEnd = 36
local kControlIDRewind = 37
local kControlIDForward = 38
local kControlIDAllBypass = 39

---
-- Controller info
--
function controller_info()
    return {
        model = "Steinberg CC121",
        manufacturer = "YAMAHA",
        copyright = "©2026 Kristjan Knight",
        version = 105,


        --
        -- MIDI device setup
        --
        items = {
            -- Selected-channel volume fader (Pitch Bend 14-bit)
            {
                name = "Fader",
                label = "Selected Vol",
                controlID = kControlIDFader,
                objectType = "VFader",
                midiType = "Absolute",
                valueMode = kAssignScaled,
                midiTouched = { 0x90, NOTE.FADER_TOUCH, MIDI_LSB },
                hasFeedback = true,
                hasFeedbackValueText = true,
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xE0, MIDI_LSB, MIDI_MSB }
            },

            -- Pan encoder: CC16, relative 2's complement
            {
                name = "Pan",
                label = "Pan",
                controlID = kControlIDPan,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.PAN, MIDI_LSB }
            },

            -- Mute
            {
                name = "Mute",
                label = "Mute",
                controlID = kControlIDMute,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.MUTE, MIDI_LSB }
            },

            -- Solo
            {
                name = "Solo",
                label = "Solo",
                controlID = kControlIDSolo,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.SOLO, MIDI_LSB }
            },

            -- Input Monitor
            {
                name = "InputMonitor",
                label = "In Mon",
                controlID = kControlIDInputMonitor,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.INPUT_MONITOR, MIDI_LSB }
            },

            -- Record Arm
            {
                name = "RecArm",
                label = "RecArm",
                controlID = kControlIDRecArm,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.RECORD_ARM, MIDI_LSB }
            },

            -- Automation Read
            {
                name = "Read",
                label = "Auto R",
                controlID = kControlIDRead,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.AUTOMATION_READ, MIDI_LSB }
            },

            -- Automation Write
            {
                name = "Write",
                label = "Auto W",
                controlID = kControlIDWrite,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.AUTOMATION_WRITE, MIDI_LSB }
            },

            -- Channel Select Left
            {
                name = "ChanLeft",
                label = "Ch <",
                controlID = kControlIDChanLeft,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.CHANNEL_SELECT_LEFT, MIDI_LSB }
            },

            -- Channel Select Right
            {
                name = "ChanRight",
                label = "Ch >",
                controlID = kControlIDChanRight,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.CHANNEL_SELECT_RIGHT, MIDI_LSB }
            },

            -- Transport buttons
            {
                name = "Play",
                label = "Play",
                controlID = kControlIDPlay,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.PLAY, MIDI_LSB }
            },

            {
                name = "Stop",
                label = "Stop",
                controlID = kControlIDStop,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.STOP, MIDI_LSB }
            },

            {
                name = "Record",
                label = "Rec",
                controlID = kControlIDRecord,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.RECORD, MIDI_LSB }
            },

            {
                name = "Loop",
                label = "Cycle",
                controlID = kControlIDLoop,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.LOOP, MIDI_LSB }
            },

            -- JOG mode toggle button
            {
                name = "Jog",
                label = "JOG",
                controlID = kControlIDJog,
                objectType = "Button",
                midiType = "Momentary",
                hasFeedback = true,
                maxVal = 2,
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.JOG, MIDI_LSB }
            },

            -- AI knob — same physical control, used in both modes
            {
                name = "AI",
                label = "AI",
                controlID = kControlIDAI,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.AI_KNOB, MIDI_LSB }
            },

            -- The physical E-Button
            {
                name = "EBUTTON",
                label = "E-Btn",
                controlID = kControlIDE,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                hasFeedback = true,
                maxVal = 127,
                valueMode = kAssignRotate,
                midi = { 0x90, NOTE.E_BUTTON, MIDI_LSB }
            },

            -- Open VST button
            {
                name = "OpenVST",
                label = "Open Plugin",
                controlID = kControlIDVst,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.OPEN_VSTI, MIDI_LSB }
            },

            -- EQ Buttons
            -- Lo EQ Q
            {
                name = "LoEqQ",
                label = "Lo EQ Q",
                controlID = kControlIDLoQQ,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_Q1, MIDI_LSB }
            },
            -- Lo EQ Frequency
            {
                name = "LoEqFreq",
                label = "Lo EQ Frequency",
                controlID = kControlIDLoFreq,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_FREQUENCY1, MIDI_LSB }
            },
            -- Lo EQ Gain
            {
                name = "LoEqGain",
                label = "Lo EQ Gain",
                controlID = kControlIDLoGain,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_GAIN1, MIDI_LSB }
            },
            -- Lo EQ Enable
            {
                name = "LoEqEnable",
                label = "Lo EQ Enable",
                controlID = kControlIDLoEnable,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.EQ_ENABLE1, MIDI_LSB }
            },

            -- Lo Mid EQ Q
            {
                name = "LoMidEqQ",
                label = "Lo Mid EQ Q",
                controlID = kControlIDLoMidQQ,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_Q2, MIDI_LSB }
            },
            -- Lo Mid EQ Frequency
            {
                name = "LoMidEqFreq",
                label = "Lo Mid EQ Frequency",
                controlID = kControlIDLoMidFreq,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_FREQUENCY2, MIDI_LSB }
            },
            -- Lo Mid EQ Gain
            {
                name = "LoMidEqGain",
                label = "Lo Mid EQ Gain",
                controlID = kControlIDLoMidGain,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_GAIN2, MIDI_LSB }
            },
            -- Lo Mid EQ Enable
            {
                name = "LoMidEqEnable",
                label = "Lo Mid EQ Enable",
                controlID = kControlIDLoMidEnable,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.EQ_ENABLE2, MIDI_LSB }
            },

            -- Hi Mid EQ Q
            {
                name = "HiMidEqQ",
                label = "Hi Mid EQ Q",
                controlID = kControlIDHiMidQQ,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_Q3, MIDI_LSB }
            },
            -- Hi Mid EQ Frequency
            {
                name = "HiMidEqFreq",
                label = "Hi Mid EQ Frequency",
                controlID = kControlIDHiMidFreq,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_FREQUENCY3, MIDI_LSB }
            },
            -- Hi Mid EQ Gain
            {
                name = "HiMidEqGain",
                label = "Hi Mid EQ Gain",
                controlID = kControlIDHiMidGain,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_GAIN3, MIDI_LSB }
            },
            -- Hi Mid EQ Enable
            {
                name = "HiMidEqEnable",
                label = "Hi Mid EQ Enable",
                controlID = kControlIDHiMidEnable,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.EQ_ENABLE3, MIDI_LSB }
            },

            -- Hi EQ Q
            {
                name = "HiEqQ",
                label = "Hi EQ Q",
                controlID = kControlIDHiQQ,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_Q4, MIDI_LSB }
            },
            -- Hi EQ Frequency
            {
                name = "HiEqFreq",
                label = "Hi EQ Frequency",
                controlID = kControlIDHiFreq,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_FREQUENCY4, MIDI_LSB }
            },
            -- Hi EQ Gain
            {
                name = "HiEqGain",
                label = "Hi EQ Gain",
                controlID = kControlIDHiGain,
                objectType = "Knob",
                midiType = "RelativeSM",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0xB0, CC.EQ_GAIN4, MIDI_LSB }
            },
            -- Hi EQ Enable
            {
                name = "HiEqEnable",
                label = "Hi EQ Enable",
                controlID = kControlIDHiEnable,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.EQ_ENABLE4, MIDI_LSB }
            },

            -- EQ Type Btn
            {
                name = "EqType",
                label = "EQ Type",
                controlID = kControlIDEqType,
                objectType = "Button",
                midiType = "Momentary",
                hasFeedback = true,
                maxVal=2,
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.EQ_TYPE, MIDI_LSB }
            },

            -- To Start button
            {
                name = "ToStart",
                label = "To Start",
                controlID = kControlIDToStart,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.TO_START, MIDI_LSB }
            },

            -- To End button
            {
                name = "ToEnd",
                label = "To End",
                controlID = kControlIDToEnd,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.TO_END, MIDI_LSB }
            },

            -- Rewind
            {
                name = "Rewind",
                label = "Rewind",
                controlID = kControlIDRewind,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.REWIND, MIDI_LSB }
            },

            -- Forward
            {
                name = "Forward",
                label = "Forward",
                controlID = kControlIDForward,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.FORWARD, MIDI_LSB }
            },
            -- All Bypass button
            {
                name = "AllBypass",
                label = "Bypass EQ",
                controlID = kControlIDAllBypass,
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.ALL_BYPASS, MIDI_LSB }
            }

        },

        --
        -- Logic/Mainstage/GarageBand assignments
        --
        assignments = {

            ----------------------------------------------------------------
            -- GLOBAL ZONE: always-active, mode-free controls
            ----------------------------------------------------------------
            { zone = 'CC121: Global' },

            -- Channel Select (always active, not mode-dependent)
            { control = "ChanLeft", keyCmd = KEYCMD.TRACK_LEFT },
            { control = "ChanRight", keyCmd = KEYCMD.TRACK_RIGHT },

            ----------------------------------------------------------------
            -- AI KNOB ZONE: modes for the AI knob (Global vs Jog)
            ----------------------------------------------------------------
            { zone = 'CC121: AI Knob' },

            -- MODE: Global — AI knob controls plugin parameter
            { mode = MODE.ai },
            { control = 'Jog', setMode = MODE.jog, feedbackVal = 0 },
            --{ control = "AI", CSTrack = 0, trackParam = CS_PLUGINPAR1, paramName = "@tp,@tn" },
            { control = 'AI', globalObj = AGL_HORIZONTALZOOM, localResolution = 127 },

            -- MODE: Jog — AI knob controls scrub/jog
            { mode = MODE.jog },
            { control = 'Jog', setMode = MODE.ai, feedbackVal = 1 },
            { control = "AI", globalObj = AGL_SCRUB, clockPart = ACP_FORMAT,
              valueMode = kAssignRelative, paramName = "Scrub", localResolution = 127 },

            ----------------------------------------------------------------
            -- MIXER ZONE: always-active, no modes
            ----------------------------------------------------------------
            { zone = 'CC121: Mixer' },

            { control = "Fader", CSTrack = 0, trackParam = AUVOLUME, paramName = "@tn Level" },
            { control = "Pan", CSTrack = 0, trackParam = AUPAN, paramName = "@tn Pan" },
            { control = "Mute", CSTrack = 0, trackParam = AUMUTE, paramName = "@tn Mute" },
            { control = "Solo", CSTrack = 0, trackParam = AUSOLO, paramName = "@tn Solo" },
            { control = "InputMonitor", CSTrack = 0, trackParam = TRACKPARAM.INPUT_MON, paramName = "@tn Input Monitor" },
            { control = "RecArm", CSTrack = 0, trackParam = CS_RECRDY, paramName = "@tn Rec Ready" },
            { control = "OpenVST", keyCmd = KEYCMD.PLUG_INS },

            -- This toggles On/Off selected track automation and put it in Read mode
            { control = "Read", CSTrack = 0, trackParam = CS_AUTO, valueMode = kAssignToggle, minVal = 1, multiply = 1, paramName = '@tn Read' },

            -- This toggles between Read/Latch automation for the selected track
            { control = "Write", keyCmd = KEYCMD.AUTO },

            -- Automation write mode - we dont want this, leaving it for reference
            --{ control = "Write",  CSTrack = 0, trackParam = CS_AUTO, valueMode = kAssignDirect, paramName = 'Automation ' },


            ----------------------------------------------------------------
            -- TRANSPORT ZONE: always-active, no modes
            ----------------------------------------------------------------
            { zone = 'CC121: Transport' },

            { control = "Play", keyCmd = KEYCMD.PLAY_TOGGLE },
            { control = "Stop", keyCmd = KEYCMD.STOP },
            { control = "Record", keyCmd = KEYCMD.RECORD },
            { control = "Loop", keyCmd = KEYCMD.CYCLE },
            { control = "Rewind", keyCmd = KEYCMD.REWIND },
            { control = "Forward", keyCmd = KEYCMD.FORWARD },
            { control = "ToStart", keyCmd = KEYCMD.PREV_MARKER },
            { control = "ToEnd", keyCmd = KEYCMD.NEXT_MARKER },

            ----------------------------------------------------------------
            -- VIEW TOGGLE ZONE (The Rotate Logic)
            ----------------------------------------------------------------
            { zone = 'CC121: View Toggle' },

            { control = "EBUTTON", group = "ViewCycle", valueMode = kAssignRotate, setMode = MODE.viewOff },

            -- When in Automation Mode: EBUTTON press triggers Automation Key Command
            { mode = MODE.viewAuto },
            { control = "EBUTTON", keyCmd = KEYCMD.VIEW_AUTOMATION, group = "ViewCycle", feedbackVal = 2 },

            -- When in Flex Mode: EBUTTON press triggers Flex Key Command
            { mode = MODE.viewFlex },
            { control = "EBUTTON", keyCmd = KEYCMD.VIEW_FLEX, group = "ViewCycle", feedbackVal = 3 },

            { mode = MODE.viewOff },
            { control = "EBUTTON", keyCmd = KEYCMD.VIEW_FLEX, group = "ViewCycle", feedbackVal = 0 },

            ----------------------------------------------------------------
            -- EQ ZONE
            -- Band numbering: Lo=1, LoMid=2, HiMid=3, Hi=4
            ----------------------------------------------------------------
            { zone = 'CC121: EQ' },

            { control = 'AllBypass', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 32,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ,
              paramName = '' },

            -- Default MODE: Eq Bank 1
            { mode = MODE.eqBank1 },
            { control = 'EqType', setMode = MODE.eqBank2, feedbackVal = 0 },

            -- Lo Cut
            { control = 'LoEqQ', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 3, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Low Cut Q-Factor' },
            { control = 'LoEqFreq', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 1, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Low Cut Frequency' },
            { control = 'LoEqGain', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 2, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Low Cut Slope' },
            { control = 'LoEqEnable', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 0,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Low Cut On/Off' },

            -- Peak 1
            { control = 'LoMidEqQ', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 11, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 1 Q-Factor' },
            { control = 'LoMidEqFreq', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 9, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 1 Frequency' },
            { control = 'LoMidEqGain', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 10, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 1 Slope' },
            { control = 'LoMidEqEnable', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 8,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 1 On/Off' },

            -- Peak 3
            { control = 'HiMidEqQ', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 19, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 3 Q-Factor' },
            { control = 'HiMidEqFreq', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 17, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 3 Frequency' },
            { control = 'HiMidEqGain', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 18, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 3 Slope' },
            { control = 'HiMidEqEnable', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 16,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 3 On/Off' },

            -- Hi Shelf
            { control = 'HiEqQ', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 27, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Hi Shelf Q-Factor' },
            { control = 'HiEqFreq', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 25, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Hi Shelf Frequency' },
            { control = 'HiEqGain', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 26, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Hi Shelf Slope' },
            { control = 'HiEqEnable', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 24,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Hi Shelf On/Off' },

            -- MODE: Eq Bank 2
            { mode = MODE.eqBank2 },
            { control = 'EqType', setMode = MODE.eqBank1, feedbackVal = 1 },

            -- Low Shelf
            { control = 'LoEqQ', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 7, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Low Shelf Q-Factor' },
            { control = 'LoEqFreq', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 5, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Low Shelf Frequency' },
            { control = 'LoEqGain', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 6, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Low Shelf Slope' },
            { control = 'LoEqEnable', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 4,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Low Shelf On/Off' },

            -- Peak 2
            { control = 'LoMidEqQ', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 15, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 2 Q-Factor' },
            { control = 'LoMidEqFreq', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 13, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 2 Frequency' },
            { control = 'LoMidEqGain', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 14, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 2 Slope' },
            { control = 'LoMidEqEnable', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 12,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 2 On/Off' },

            -- Peak 4
            { control = 'HiMidEqQ', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 23, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 4 Q-Factor' },
            { control = 'HiMidEqFreq', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 21, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 4 Frequency' },
            { control = 'HiMidEqGain', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 22, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 4 Slope' },
            { control = 'HiMidEqEnable', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 20,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Peak 4 On/Off' },

            -- Hi Cut
            { control = 'HiEqQ', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 31, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Hi Cut Q-Factor' },
            { control = 'HiEqFreq', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 29, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Hi Cut Frequency' },
            { control = 'HiEqGain', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 30, localResolution = 127,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Hi Cut Slope' },
            { control = 'HiEqEnable', CSTrack = 0, trackParam = CS_BOUNDPLUGINPAR1, paramOffset = 28,
              boundManuf = BOUND_MANUF.EMAG, boundSubID = 0, boundPlugInID = BOUND_ID.CHANNEL_EQ, paramName = 'Hi Cut On/Off' }

        }
    }
end