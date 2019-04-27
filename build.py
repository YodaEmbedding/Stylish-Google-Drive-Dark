#!/usr/bin/env python3

import argparse
import datetime
import os

IN_FILE = 'userstyles.user.css'
OUT_FILE = 'stylish.user.css'

REPLACEMENTS = [
    ('/*[[theme_drive]]*/',         ('domain("drive.google.com"), '
                                     'url-prefix("http://docs.google.com/document/u/"), '
                                     'url-prefix("https://docs.google.com/document/u/"), '
                                     'url-prefix("http://docs.google.com/spreadsheets/u/"), '
                                     'url-prefix("https://docs.google.com/spreadsheets/u/")')),
    ('/*[[theme_docs]]*/',          ('url-prefix("http://docs.google.com/document/d/"), '
                                     'url-prefix("https://docs.google.com/document/d/")')),
    ('/*[[theme_sheets]]*/',        ('url-prefix("http://docs.google.com/spreadsheets/d/"), '
                                     'url-prefix("https://docs.google.com/spreadsheets/d/"), '
                                     'url-prefix("http://docs.google.com/spreadsheet/"), '
                                     'url-prefix("https://docs.google.com/spreadsheet/")')),
    ('/*[[theme_sheets_canvas]]*/', ('url-prefix("http://docs.google.com/spreadsheets/d/"), '
                                     'url-prefix("https://docs.google.com/spreadsheets/d/"), '
                                     'url-prefix("http://docs.google.com/spreadsheet/"), '
                                     'url-prefix("https://docs.google.com/spreadsheet/")')),
    ('/*[[page_bgrnd_color]]*/',    '#333333'),
    ('/*[[normal_text_color]]*/',   '#DDDDDD'),
    ('/*[[caret_border_color]]*/',  '#CC9922'),
    ('/*[[caret_glow_color]]*/',    '#FFBB55'),
    ('/*[[home_sidebar_color]]*/',  '#404040'),
    ('/*[[home_list_color]]*/',     '#333333'),
]

def build():
    print(f'Building on {datetime.datetime.now()}...')
    with open(IN_FILE,  'r') as f_in, \
         open(OUT_FILE, 'w') as f_out:
        for line in f_in:
            for s, r in REPLACEMENTS:
                line = line.replace(s, r)
            f_out.write(line)

def main():
    parser = argparse.ArgumentParser(description='Build userstyle.')
    parser.add_argument('-m', '--monitor', action='store_true')
    args = parser.parse_args()

    build()

    if args.monitor:
        import pyinotify

        class ModificationHandler(pyinotify.ProcessEvent):
            def my_init(self, watch_list):
                self.watch_list = watch_list

            def process_IN_MODIFY(self, event):
                path = os.path.basename(event.pathname)
                if any(f == path for f in self.watch_list):
                    build()

        handler = ModificationHandler(watch_list=[IN_FILE])
        wm = pyinotify.WatchManager()
        notifier = pyinotify.Notifier(wm, handler)
        wdd = wm.add_watch(os.getcwd(), pyinotify.IN_MODIFY)
        notifier.loop()

main()
