# Building

In order to allow the user customizations on userstyles.org, the file `userstyles.user.css` contains variables such as:

    /*[[page_bgrnd_color]]*/

To replace these with your customized values, edit `build.py` accordingly, and then run:

    python3 build.py

This will generate a file called `stylish.user.css`.

# Previewing changes

To preview locally built themes, do the following:

1. Go to your browser extension settings and allow Stylus to view local files.
   1. Chrome: `chrome://extensions` -> Stylus "Details" -> "Allow access to file URLs"
   2. Firefox seems to have it by default
   3. Opera: ` opera://extensions` -> "Allow access to file URLs" under Stylus
2. Open the built file (`stylish.user.css`) in your browser (url: `file://path/to/stylish.user.css`). It should open a new Stylus tab.
3. On this tab, tick the "Live Reload" option, and then "Install Style". Make sure to remove the style installed from userstyles.org so that Stylus will use the built one.

Now, if you modify `userstyles.user.css` and run `build.py`, the changes will be reflected immediately in your browser page.


# Todo

 - Docs: Darker ruler
 - Docs: Enable/disable userstyles.org option
 - Docs: Readable equations toolbar
 - Docs: `https?://docs.google.com/document/u/\d+/`
 - Drive Home: Borders
 - Drive Home: Enable/disable userstyles.org option
 - Drive Home: Hover highlights
 - Drive Home: Toolbar logo/user thumbnail invert

 - Formatting
 - Move duplicate settings into variables (e.g. `##docs-toolbar-wrapper` and `.goog-toolbar-button` share the value `#444`)

