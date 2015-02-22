#!/usr/bin/env python
# coding: utf-8
# -*- coding: utf-8 -*-
# # vim: set fileencoding=utf-8 :

import re

def convert_symbol(name):
  index = 0
  while (index > -1):
    name = name[:index] + name[index+1:index+2].upper()+ name[index+2:]
    index = name.find('-', index+1)
  return name


head = "typedef NS_ENUM(UniChar, NIKFontAwesomeIcon) {\n"
code = "    NIKFontAwesomeIcon{} = 0x{},\n"
foot = "};\n"
w = open('./NIKFontAwesomeIcon.h', 'w')
w.write(head)
f = open('./Font-Awesome/scss/_variables.scss', 'r')
rx = re.compile('^\$fa-var([\w\d\-]+): \"\\\\(f[\d\w]*)\";')
lines = [l for l in f.read().split("\n") if rx.match(l)]
pairs = [rx.findall(line)[0] for line in lines]
symbol_pairs = sorted([(convert_symbol(pair[0]), pair[1]) for pair in pairs], key=lambda t: t[0])

for symbol in symbol_pairs:
  w.write(code.format(symbol[0], symbol[1]))

w.write(foot)
