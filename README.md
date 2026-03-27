# Steinberg CC121 for Logic Pro

<div style='text-align: center; padding: 1rem; padding-left: 2rem; padding-right: 2rem'>

![CC121](CC121.jpg)

</div>

This is an opinionated Logic Pro X MIDI device script for the Steinberg CC121 MIDI controller. 

 - Relativly expensive device,
 - Didn't want to spend too much money on a new controller,
 - Wanted to use it with Logic Pro.

## Features and Control Mapping Overview

As the controller is originally designed for Cubase all mapings don't make sense for Logic Pro. Deviations from the Cubase mappings are listed below:



### Full Mapping table

**Channel Strip** — operates on the selected track:

| Control          | Function                              |
|------------------|---------------------------------------|
| Fader            | Volume                                |
| Pan knob         | Pan                                   |
| Mute             | Mute toggle                           |
| Solo             | Solo toggle                           |
| Automation Read  | Read automation                       |
| Automation Write | Write automation                      |
| Monitor          | Input monitoring                      |
| Record Arm       | Arm for recording<br/>Will blink when |
| e-Button         | recording is active                   |
| Edit Instrument  | Open/Close plugin windows             |
| Channel ◀ / ▶    | Select previous/next track            |

**EQ Section** — 4-band parametric EQ:

| Knob row         | Parameter            |
|------------------|----------------------|
| Top row          | Q (bandwidth)        |
| Middle row       | Frequency            |
| Bottom row       | Gain                 |
| Band buttons     | Band enable/bypass   |
| All Bypass       | EQ bypass            |
| EQ Type          | Cycle EQ band type   |

**Transport:**

| Button            | Function                   |
|-------------------|----------------------------|
| Play              | Play / Pause               |
| Stop              | Stop                       |
| Record            | Record                     |
| Cycle             | Loop on/off                |
| Rewind / Forward  | Scrub backward/forward     |
| ◀ / ▶             | Go to previous/next marker |

**AI Knob & Function Keys:**

| Control          | Function             |
|------------------|----------------------|
| AI Knob          | Jog/Scrub or Zoom (when Lock is active) |
| Lock             | Toggle AI Knob between jog and zoom mode |
| Jog              | Toggle jog acceleration |
| Function 1–4     | User-assignable shortcuts |


## Installation

````
/Library/Audio/Midi Device Scripts
````

## Developing

## Acknowledgements

## License

## Disclaimer