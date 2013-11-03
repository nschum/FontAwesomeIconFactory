#!/opt/local/bin/python
# coding: utf-8
# -*- coding: utf-8 -*-
# # vim: set fileencoding=utf-8 :
import re
head = "typedef enum NIKFontAwesomeIcon : UniChar {\n"
code = "    NIKFontAwesomeIcon{} = 0x{},\n"
foot = "} NIKFontAwesomeIcon;\n"
w = open('./NIKFontAwesomeIcon.h', 'w')
w.write(head)
f = open('./Font-Awesome/scss/_variables.scss', 'r')
rx = re.compile('^\$fa-var([\w\d\-]+): \"\\\\(f[\d\w]*)\";')
lines = [l for l in f.read().split("\n") if rx.match(l)]
for line in lines:
	m = rx.findall(line)[0]
	name = m[0]
	index = 0
	while (index > -1):
		name = name[:index] + name[index+1:index+2].upper()+ name[index+2:]
		index = name.find('-', index+1)
	w.write(code.format(name, m[1]))
w.write(foot)
