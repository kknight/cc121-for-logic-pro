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
    viewOff  = 'Off',
}

--
-- Constants
--

-- MIDI Note numbers (buttons)
NOTE = {
    RECORDARM = 0x00,
    SOLO = 0x08,
    MUTE = 0x10,
    CHANNELSELECTLEFT = 0x30,
    CHANNELSELECTRIGHT = 0x31,
    EBUTTON = 0x33,
    FUNCTION1 = 0x36,
    FUNCTION2 = 0x37,
    FUNCTION3 = 0x38,
    FUNCTION4 = 0x39,
    VALUEENCODERBUTTON = 0x3A,
    FOOTSWITCH = 0x3B,
    AUTOMATIONREAD = 0x4A,
    AUTOMATIONWRITE = 0x4B,
    LOOP = 0x56,
    TOSTART = 0x58,
    TOEND = 0x5A,
    REWIND = 0x5B,
    FORWARD = 0x5C,
    STOP = 0x5D,
    PLAY = 0x5E,
    RECORD = 0x5F,
    FADERTOUCH = 0x68,
    EQENABLE1 = 0x70,
    EQENABLE2 = 0x71,
    EQENABLE3 = 0x72,
    EQENABLE4 = 0x73,
    EQTYPE = 0x74,
    ALLBYPASS = 0x75,
    JOG = 0x76,
    LOCK = 0x77,
    INPUTMONITOR = 0x78,
    OPENVSTI = 0x79
}

-- MIDI CC numbers (knobs / encoders)
CC = {
    PAN = 0x10,
    EQQ1 = 0x20,
    EQQ2 = 0x21,
    EQQ3 = 0x22,
    EQQ4 = 0x23,
    EQFREQUENCY1 = 0x30,
    EQFREQUENCY2 = 0x31,
    EQFREQUENCY3 = 0x32,
    EQFREQUENCY4 = 0x33,
    EQGAIN1 = 0x40,
    EQGAIN2 = 0x41,
    EQGAIN3 = 0x42,
    EQGAIN4 = 0x43,
    VALUE = 0x50,
    AIKNOB = 0x3C
}

KEYCMD = {
    -- Automation
    VIEW_AUTOMATION = 116,
    VIEW_FLEX       = 1753,
    AUTO = 1015,
    AUTOSELECT = 1378,

    -- Track selection
    TRACKLEFT = 1272, -- Select Previous Track
    TRACKRIGHT = 1273, -- Select Next Track

    -- Transport / workflow
    CAPTURE_MIDI = 542, -- Capture as Recording
    QUANTIZE = 110, -- Quantize Selected Regions/Cells/Events
    CLICK = 474, -- Toggle Metronome Click
    UNDO = 761, -- Undo
    REDO = 796, -- Redo

    PLAY_TOGGLE = 535, -- Play or Stop
    STOP = 5, -- Stop
    RECORD = 7, -- Record
    CYCLE = 15    -- Cycle Mode
}

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

---
-- Controller info
--
function controller_info()
    return {
        model = "Steinberg CC121",
        manufacturer = "YAMAHA",
        copyright = "©2026 Kristjan Knight",
        version = "1.0.0",


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
                midiTouched = { 0x90, NOTE.FADERTOUCH, MIDI_LSB },
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
                midi = { 0x90, NOTE.INPUTMONITOR, MIDI_LSB }
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
                midi = { 0x90, NOTE.RECORDARM, MIDI_LSB }
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
                midi = { 0x90, NOTE.AUTOMATIONREAD, MIDI_LSB }
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
                midi = { 0x90, NOTE.AUTOMATIONWRITE, MIDI_LSB }
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
                midi = { 0x90, NOTE.CHANNELSELECTLEFT, MIDI_LSB }
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
                midi = { 0x90, NOTE.CHANNELSELECTRIGHT, MIDI_LSB }
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
                midi = { 0xB0, CC.AIKNOB, MIDI_LSB }
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
                valueMode = kAssignRotate,
                midi = { 0x90, NOTE.EBUTTON, MIDI_LSB }
            },

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
            { control = "ChanLeft", keyCmd = KEYCMD.TRACKLEFT },
            { control = "ChanRight", keyCmd = KEYCMD.TRACKRIGHT },

            ----------------------------------------------------------------
            -- AI KNOB ZONE: modes for the AI knob (Global vs Jog)
            ----------------------------------------------------------------
            { zone = 'CC121: AI Knob' },

            -- MODE: Global — AI knob controls plugin parameter
            { mode = MODE.ai },
            { control = 'Jog', setMode=MODE.jog, feedbackVal = 0 },
            --{ control = "AI", CSTrack = 0, trackParam = CS_PLUGINPAR1, paramName = "@tp,@tn" },
            {control='AI', globalObj=AGL_HORIZONTALZOOM },

            -- MODE: Jog — AI knob controls scrub/jog
            { mode = MODE.jog },
            { control = 'Jog', setMode=MODE.ai, feedbackVal = 1 },
            { control = "AI", globalObj = AGL_SCRUB, clockPart = ACP_FORMAT,
              valueMode = kAssignRelative, paramName = "Scrub" },

            ----------------------------------------------------------------
            -- MIXER ZONE: always-active, no modes
            ----------------------------------------------------------------
            { zone = 'CC121: Mixer' },

            { control = "Fader",  CSTrack = 0, trackParam = AUVOLUME,  paramName = "@tn Level" },
            { control = "Pan",    CSTrack = 0, trackParam = AUPAN,     paramName = "@tn Pan" },
            { control = "Mute",   CSTrack = 0, trackParam = AUMUTE,    paramName = "@tn Mute" },
            { control = "Solo",   CSTrack = 0, trackParam = AUSOLO,    paramName = "@tn Solo" },
            { control = "InputMonitor", CSTrack = 0, trackParam = AUINPUTMON, paramName = "@tn Input Monitor" },
            { control = "RecArm", CSTrack = 0, trackParam = CS_RECRDY, paramName = "@tn Rec Ready" },

            -- This toggles On/Off selected track automation and put it in Read mode
            { control = "Read",   CSTrack = 0, trackParam = CS_AUTO, valueMode = kAssignToggle, minVal = 1, multiply = 1, paramName = '@tn Read' },

            -- This toggles between Read/Latch automation for the selected track
            { control = "Write", keyCmd = KEYCMD.AUTO  },

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

            ----------------------------------------------------------------
            -- VIEW TOGGLE ZONE (The Rotate Logic)
            ----------------------------------------------------------------
            { zone = 'CC121: View Toggle' },

            { control = "EBUTTON", group = "ViewCycle", valueMode = kAssignRotate, setMode=MODE.viewOff },

            -- When in Automation Mode: EBUTTON press triggers Automation Key Command
            { mode=MODE.viewAuto },
            { control = "EBUTTON", keyCmd = KEYCMD.VIEW_AUTOMATION, group = "ViewCycle" },

            -- When in Flex Mode: EBUTTON press triggers Flex Key Command
            { mode=MODE.viewFlex },
            { control = "EBUTTON", keyCmd = KEYCMD.VIEW_FLEX, group = "ViewCycle" },

            { mode=MODE.viewOff },
            { control = "EBUTTON", keyCmd = KEYCMD.VIEW_FLEX, group = "ViewCycle" },

        }
    }
end