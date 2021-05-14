# Gnome Zoom Mouse Trails Workaround

In recent versions of Gnome, many users will see mouse trails while the Zoom or magnifier feature is enabled. This bash script serves as a workaround.

## Usage

 When run with the argument "out," the script zooms out with the Gnome Zoom tool, but if the updated magnification is less than 2.0, the Zoom feature is disabled. Since the zoom feature is disabled, the user won't see trails. When run with the argument "in," the script zooms in using the Gnome zoom tool, enabling the tool if needed.
 
 After putting the script on the path, use
 
 ```bash
 magnifier.sh in
 ```

and 

```bash
magnifier.sh out
```

to zoom in and out respectively.

## Binding to a keyboard shortcut

If you'd like to use the default shortcuts (Super + Alt + = and Super + Alt + -) to zoom in and out, you'll first need to disable the default zoom in and zoom out shortcuts in the Keybord Shortcuts application in Gnome. Once those shortcuts are disabled, you can install xbindkeys, which allows you to remap key commands, with

```bash
sudo apt-get install  xbindkeys
```

Then you can copy the provided `.xbindkeysrc` file in this repository to your home folder, or append its contents to your existing `.xbindkeysrc` file. Make sure the `magnifier.sh` file is on your path, such as in your `/usr/bin` folder, or the bindings won't work.
