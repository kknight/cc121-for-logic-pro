function controller_info()
    return {
        model = "CC121",
        manufacturer = "Steinberg",

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
                midiTouched = { 0x90, 104, MIDI_VALUE },

                hasFeedback = true,
                hasFeedbackValueText = true,

                -- Pitch Bend on channel 1
                midi = { 0xE0, MIDI_LSB, MIDI_MSB }
            },

            {
                name = "FaderTouch",
                label = "Touch",
                objectType = "Button",
                midiType = "Momentary",
                midi = { 0x90, 104, MIDI_LSB }
            },

            -- Pan encoder: CC16 (0x10), relative 2's complement (right=1.., left=65..)
            {
                name = "Pan",
                label = "Pan",
                objectType = "Knob",
                midiType = "RelativeSM",
                midi = { 0xB0, 0x10, MIDI_LSB }
            },

            -- Transport buttons
            { name = "Play", label = "Play", objectType = "Button", midiType = "Momentary", midi = { 0x90, 0x5E, MIDI_LSB } },
            { name = "Stop", label = "Stop", objectType = "Button", midiType = "Momentary", midi = { 0x90, 0x5D, MIDI_LSB } },
            { name = "Record", label = "Rec", objectType = "Button", midiType = "Momentary", midi = { 0x90, 0x5F, MIDI_LSB } },
            { name = "Loop", label = "Cycle", objectType = "Button", midiType = "Momentary", midi = { 0x90, 0x56, MIDI_LSB } },
        },

        -- Minimal assignments so Logic knows what these controls should do
        assignments = {
            { zone = "CC121: Mixer" },
            { mode = "Default" },

            -- Selected track (CSTrack=0) volume + pan
            { control = "Fader", CSTrack = 0, trackParam = AUVOLUME, paramName = "@tn Level" },
            { control = "FaderTouch", CSTrack = 0, trackParam = AUVOLUME, touch = true },
            { control = "Pan", CSTrack = 0, trackParam = AUPAN, paramName = "@tn Pan" },

            -- Transport (Key Commands)
            { control = "Play", keyCommand = KCT_PLAY },
            { control = "Stop", keyCommand = KCT_STOP },
            { control = "Record", keyCommand = KCT_RECORD },
            { control = "Loop", keyCommand = KCT_CYCLE },
        }
    }
end