#!/usr/bin/env python3

import os

replacements = [
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

with open('google-drive-dark-userstyles.css', 'r') as f_in, \
     open('google-drive-dark-stylish.css',    'w') as f_out:

    for line in f_in:
        for s, r in replacements:
            line = line.replace(s, r)

        f_out.write(line)

