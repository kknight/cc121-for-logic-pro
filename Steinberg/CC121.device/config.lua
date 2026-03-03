--
-- Globals
--
PORT_IN = 'Port1'
PORT_OUT = 'Port1'

--
-- Constants
--

-- MIDI Note numbers (buttons)
NOTE = {
    RECORDARM           = 0x00,
    SOLO                = 0x08,
    MUTE                = 0x10,
    CHANNELSELECTLEFT   = 0x30,
    CHANNELSELECTRIGHT  = 0x31,
    EBUTTON             = 0x33,
    FUNCTION1           = 0x36,
    FUNCTION2           = 0x37,
    FUNCTION3           = 0x38,
    FUNCTION4           = 0x39,
    VALUEENCODERBUTTON  = 0x3A,
    FOOTSWITCH          = 0x3B,
    AUTOMATIONREAD      = 0x4A,
    AUTOMATIONWRITE     = 0x4B,
    LOOP                = 0x56,
    TOSTART             = 0x58,
    TOEND               = 0x5A,
    REWIND              = 0x5B,
    FORWARD             = 0x5C,
    STOP                = 0x5D,
    PLAY                = 0x5E,
    RECORD              = 0x5F,
    FADERTOUCH          = 0x68,
    EQENABLE1           = 0x70,
    EQENABLE2           = 0x71,
    EQENABLE3           = 0x72,
    EQENABLE4           = 0x73,
    EQTYPE              = 0x74,
    ALLBYPASS           = 0x75,
    JOG                 = 0x76,
    LOCK                = 0x77,
    INPUTMONITOR        = 0x78,
    OPENVSTI            = 0x79
}

-- MIDI CC numbers (knobs / encoders)
CC = {
    PAN            = 0x10,
    EQQ1           = 0x20,
    EQQ2           = 0x21,
    EQQ3           = 0x22,
    EQQ4           = 0x23,
    EQFREQUENCY1   = 0x30,
    EQFREQUENCY2   = 0x31,
    EQFREQUENCY3   = 0x32,
    EQFREQUENCY4   = 0x33,
    EQGAIN1        = 0x40,
    EQGAIN2        = 0x41,
    EQGAIN3        = 0x42,
    EQGAIN4        = 0x43,
    VALUE          = 0x50,
    AIKNOB         = 0x3C
}

KEYCMD = {
    -- Track selection
    TRACKLEFT          = 1272, -- Select Previous Track
    TRACKRIGHT         = 1273, -- Select Next Track

    -- Transport / workflow (from other MDS examples)
    CAPTURE_MIDI       = 542,  -- Capture as Recording
    QUANTIZE           = 110,  -- Quantize Selected Regions/Cells/Events
    CLICK              = 474,  -- Toggle Metronome Click
    UNDO               = 761,  -- Undo
    REDO               = 796,  -- Redo

    PLAY_TOGGLE        = 535,  -- Play or Stop
    STOP               = 5,    -- Stop
    RECORD             = 7,    -- Record
    CYCLE              = 15    -- Cycle Mode
}

---
-- Controller info
--
function controller_info()
    return {
        model = "CC121",
        manufacturer = "Steinberg",
        copyright = "©2026 Kristjan Knight",

        auto_passthrough = false,
        ignore_notes = true,

        --
        -- MIDI device setup
        --
        items = {
            -- Selected-channel volume fader (Pitch Bend 14-bit)
            -- NOTE: your device behaves correctly with MIDI_LSB/MIDI_MSB swapped.
            {
                name = "Fader",
                label = "Selected Vol",
                objectType = "VFader",
                midiType = "Absolute",
                valueMode = kAssignScaled,

                -- CC121 touch: Note 104 (G#6) with 127 touch / 0 release
                midiTouched = { 0x90, NOTE.FADERTOUCH, MIDI_LSB },

                hasFeedback = true,
                hasFeedbackValueText = true,

                inport=PORT_IN,
                outport=PORT_OUT,

                -- Pitch Bend on channel 1
                midi = { 0xE0, MIDI_LSB, MIDI_MSB }
            },

            -- Pan encoder: CC16 (0x10), relative 2's complement (right=1.., left=65..)
            {
                name = "Pan",
                label = "Pan",
                objectType = "Knob",
                midiType = "RelativeSM",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi = { 0xB0, CC.PAN, MIDI_LSB }
            },

            -- Mute: Note 16 (0x10)
            {
                name="Mute",
                label="Mute",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, NOTE.MUTE, MIDI_LSB}  -- 0x10 == note 16
            },

            -- Solo: Note 8 (0x08)
            {
                name="Solo",
                label="Solo",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, NOTE.SOLO, MIDI_LSB}  -- 0x08 == note 8
            },

            -- Record Arm / Rec Ready: Note 0 (0x00)
            {
                name="RecArm",
                label="RecArm",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, NOTE.RECORDARM, MIDI_LSB}  -- 0x00 == note 0
            },

            -- Automation Read: Note 74 (0x4A)
            {
                name="Read",
                label="Auto R",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, NOTE.AUTOMATIONREAD, MIDI_LSB}  -- 0x4A == note 74
            },

            -- Automation Write: Note 75 (0x4B)
            {
                name="Write",
                label="Auto W",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, NOTE.AUTOMATIONWRITE, MIDI_LSB}  -- 0x4B == note 75
            },

            -- Channel Select Left: Note 48 (0x30)
            {
                name="ChanLeft",
                label="Ch <",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, NOTE.CHANNELSELECTLEFT, MIDI_LSB}
            },

            -- Channel Select Right: Note 49 (0x31)
            {
                name="ChanRight",
                label="Ch >",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, NOTE.CHANNELSELECTRIGHT, MIDI_LSB}
            },

            -- JOG button (enables jog-wheel mode): Note 0x76
            {
                name="JogMode",
                label="JOG",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, NOTE.JOG, MIDI_LSB}
            },

            -- Transport buttons
            {
                name = "Play",
                label = "Play",
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.PLAY, MIDI_LSB }
            },

            {
                name = "Stop",
                label = "Stop",
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.STOP, MIDI_LSB }
            },

            {
                name = "Record",
                label = "Rec",
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.RECORD, MIDI_LSB }
            },

            {
                name = "Loop",
                label = "Cycle",
                objectType = "Button",
                midiType = "Momentary",
                inport = PORT_IN,
                outport = PORT_OUT,
                midi = { 0x90, NOTE.LOOP, MIDI_LSB }
            },

            -- AI/Jog knob
            {
                name="AI",
                label="AI",
                objectType="Knob",
                midiType="RelativeSM",      -- if it’s 1 right / 65 left style
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0xB0, CC.AIKNOB, MIDI_LSB}
            },

        },

        --
        -- Logic/Mainstage/GarageBand assignments
        --
        assignments = {
            {zone = 'Global'},
            {mode = 'Global'},

            -- Channel Select
            { control="ChanLeft",  keyCmd=KEYCMD.TRACKLEFT }, -- Select Previous Track
            { control="ChanRight", keyCmd=KEYCMD.TRACKRIGHT }, -- Select Next Track

            -- Toggle Jog mode (press JOG to enter Jog mode)
            { control="JogMode", setMode="Jog" },

            --
            -- Mixer
            --
            { zone = "Mixer" },
            { mode = "Mixer" },

            -- Selected track (CSTrack=0) volume + pan
            { control = "Fader", CSTrack = 0, trackParam = AUVOLUME, paramName = "@tn Level" },
            { control = "Pan", CSTrack = 0, trackParam = AUPAN, paramName = "@tn Pan" },
            { control="Mute", CSTrack=0, trackParam=AUMUTE, paramName="@tn Mute" },
            { control="Solo", CSTrack=0, trackParam=AUSOLO, paramName="@tn Solo" },
            { control="RecArm", CSTrack=0, trackParam=CS_RECRDY, paramName="@tn Rec Ready" },

            -- AI knob
            { control="AI", CSTrack=0, trackParam=CS_PLUGINPAR1, paramName="@tp,@tn" },

            --
            -- Jog mode: repurpose the AI knob as a jog wheel (scrub)
            --
            { zone = "Jog" },
            { mode = "Jog" },

            -- Press JOG again to return to Mixer mode
            { control="JogMode", setMode="Mixer" },

            -- AI knob -> scrub/jog (global)
            -- NOTE: This relies on Logic's global scrub object being available as AGL_SCRUB.
            { control="AI", globalObj=AGL_SCRUB, valueMode=kAssignRelative, paramName="Jog" },

            --
            -- Transport
            --
            {zone='Transport'},
            {mode='Transport'},

            { control = "Play", keyCmd = KEYCMD.PLAY_TOGGLE },
            { control = "Stop", keyCmd = KEYCMD.STOP },
            { control = "Record", keyCmd = KEYCMD.RECORD },
            { control = "Loop", keyCmd = KEYCMD.CYCLE },

        }
    }
end