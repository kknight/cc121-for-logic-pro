--
-- Globals
--
PORT_IN = 'Port1'
PORT_OUT = 'Port1'

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
                midiTouched = { 0x90, 104, MIDI_LSB },

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
                midi = { 0xB0, 0x10, MIDI_LSB }
            },

            -- Mute: Note 16 (0x10)
            {
                name="Mute",
                label="Mute",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, 0x10, MIDI_LSB}  -- 0x10 == note 16
            },

            -- Solo: Note 8 (0x08)
            {
                name="Solo",
                label="Solo",
                objectType="Button",
                midiType="Momentary",
                inport=PORT_IN,
                outport=PORT_OUT,
                midi={0x90, 0x08, MIDI_LSB}  -- 0x08 == note 8
            },

            -- Transport buttons
            { name = "Play", label = "Play", objectType = "Button", midiType = "Momentary", inport=PORT_IN, outport=PORT_OUT, midi = { 0x90, 0x5E, MIDI_LSB } },
            { name = "Stop", label = "Stop", objectType = "Button", midiType = "Momentary", inport=PORT_IN, outport=PORT_OUT, midi = { 0x90, 0x5D, MIDI_LSB } },
            { name = "Record", label = "Rec", objectType = "Button", midiType = "Momentary", inport=PORT_IN, outport=PORT_OUT, midi = { 0x90, 0x5F, MIDI_LSB } },
            { name = "Loop", label = "Cycle", objectType = "Button", midiType = "Momentary", inport=PORT_IN, outport=PORT_OUT, midi = { 0x90, 0x56, MIDI_LSB } },
        },

        -- Minimal assignments so Logic knows what these controls should do
        assignments = {
            { zone = "CC121: Mixer" },
            { mode = "Default" },

            -- Selected track (CSTrack=0) volume + pan
            { control = "Fader", CSTrack = 0, trackParam = AUVOLUME, paramName = "@tn Level" },
            { control = "Pan", CSTrack = 0, trackParam = AUPAN, paramName = "@tn Pan" },
            { control="Mute", CSTrack=0, trackParam=AUMUTE, paramName="@tn Mute" },
            { control="Solo", CSTrack=0, trackParam=AUSOLO, paramName="@tn Solo" },

            -- Transport (Key Commands)
            { control = "Play", keyCommand = KCT_PLAY },
            { control = "Stop", keyCommand = KCT_STOP },
            { control = "Record", keyCommand = KCT_RECORD },
            { control = "Loop", keyCommand = KCT_CYCLE },
        }
    }
end