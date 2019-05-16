obrun is just a little run dialog for window managers that don't have one.  I originally wrote it for myself for [Openbox](http://openbox.org/), but it's also useful in Wayland compositors without Xwayland.

## Requirements

[gettext]: https://www.gnu.org/software/gettext/
[Git]: https://git-scm.com/
[GNU Make]: https://www.gnu.org/software/make/ 
[Perl]: https://www.perl.org/
[xmllint]: http://xmlsoft.org/
[zenity]: https://wiki.gnome.org/Projects/Zenity

Requirement  | Reason
-------------|-----------------------------------------------------------------
Bourne shell | You can't run this script without it
[zenity]     | Used to produce the dialog
[gettext]    | Needed for the localized messages
[xmllint]    | Used to read the settings file (optional, if you don't care
             | about keeping your settings)
[Perl]       | Needed to remove entries from the history file (optional)
[Git]        | Needed to produce the version information (optional)
[GNU make]   | Needed to easily install the script and gettext catalogs.  This
             | is optional, as you can simply copy the files to the right
             | places yourself. Other makes might work, but that's not
             | guaranteed.
