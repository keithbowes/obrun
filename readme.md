obrun is just a little run dialog for window managers that don't have one.  I originally wrote it for myself for [Openbox](http://openbox.org/), but it's also useful in Wayland compositors without Xwayland.

## Requirements

[gettext]: https://www.gnu.org/software/gettext/
[Git]: https://git-scm.com/
[GNU Make]: https://www.gnu.org/software/make/
[Perl]: https://www.perl.org/
[xmllint]: http://xmlsoft.org/
[zenity]: https://wiki.gnome.org/Projects/Zenity

### To run

Requirement  | Reason
-------------|-----------------------------------------------------------------
Bourne shell | You can't run this script without it
[zenity]     | Used to produce the dialog
[gettext]    | Needed for the localized messages (optional, if you don't need localized messages)
[xmllint]    | Used to read the settings file (optional, if you don't care about keeping your settings)
[Perl]       | Needed to remove entries from the history file (optional)

Other tools used like `find` and `sed` should be included in any POSIX environment that has a Bourne shell.

### To build

Requirement  | Reason
-------------|-----------------------------------------------------------------
[Git]        | Needed to clone the repository and to produce the version information
[GNU make]   | Needed to easily install the script and gettext catalogs. Other makes might work, but that's not guaranteed.

## Building

`make prefix=/usr/local`

By default, it will get installed to `$HOME`/.local

## Usage

`obrun [action] [option]`

Currently `action` can be one of: `add`, `free`, `list`, `path`, `simple`.  `list` is the default. `simple` is the equivalent of running obrun 0.1 or 0.2 without an action.  Inspired by [xclip](https://github.com/astrand/xclip/), only the first letter is significant, so you can use `a`, `add`, or `archpriesthood`, and they will be treated the same.

`option` can be one of: `-h` (help), `-n` (no lock), `-v` (version).  Again, only the first letter is significant, so, `-v`, `--version`, and `--my-own-vigil` will show the version.

## Screenshots

They're in the `ekran` directory.
