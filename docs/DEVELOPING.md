# Developing Guide

There is very little official documentation on how to write Control Surface MIDI scripts for Logic Pro.

This is my attempt to gather information on what I've been able to discover through experimentation, and observation.

## Overview

A Logic Pro controller script is a Lua file that runs inside a sandboxed environment within the DAW.

### Script Locations

Scripts can be placed in one of two locations:

```bash
# User-specific
~/Music/Audio Music Apps/MIDI Device Scripts/
```
or: 
```bash
# System-wide (available to all users)
/Library/Audio/MIDI Device Scripts/
```

**Note!**

If the script is placed in the **user-specific directory**, only the `controller_info()` function will be evaluated.  
Other functions (e.g. `controller_midi_in`, `controller_midi_out`) will **not work**.

### Naming Convention

Logic Pro expects the following naming convention:

```
Manufacturer/DeviceName.device/config.lua
```

If the naming convention is not followed then the script will still be loaded, but automatic mapping of midi inputs and outputs will not work.

### Optional Assets

You can include an optional icon `icon.png` in the same directory as `config.lua`, which should be 256x256 pixels. This icon will be displayed in the Logic Pro control surface UI.

### Debugging
The `config.lua` file is evaluated when Logic Pro initializes and is then **cached**.

To force Logic to reload your script:

- Go to Control Surface settings
- Click **“Delete all assignments”**

Alternately run the following command to enter Lua debug mode, which will then reload the script on every change:

```bash
# Launch Logic Pro with Lua debug output to terminal
cd /Applications/Logic\ Pro.app/Contents/MacOS
LUA_DEBUG=1 ./Logic\ Pro
```

This will also allow you to use the `print()` function to output debug messages to the terminal.
