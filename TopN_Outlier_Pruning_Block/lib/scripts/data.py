#!/usr/bin/env python

################################################################################
#
# Source: http://acm.zhihua-lai.com
#
################################################################################

from sys import argv, exit, stderr
from os import path

def gethex(c):
	# return hex str: char[4]
	# padding zero e.g. 0xa => 0x0a

	str = hex(ord(c))
	if len(str) == 3:
		return ("%s0%s" % (str[0:2], str[2:]))
	return str

def getbytes(filename):
	# return byte array of a file

	if not path.isfile(filename):
		stderr.write("File not found: %s\n" % filename)
		exit(2)
	try:
		fh = open(filename, 'rb')
	except IOError as e:
		stderr.write("Error reading file: %s\n" % filename)
		exit(3)
	else:
		return fh.read()
	finally:
		fh.close()

def convert(bytes, variable):
	length = len(bytes)
	if length == 0:
		return ""

	output = ("const unsigned char %s[] = {\n\t" % variable)
	i = 0
	while i < (length-1):
		output += ("%s," % gethex(bytes[i]))
		if i % 16 == 15:
			output += ("//%u\n\t" % (i+1))
		i += 1
	output += ("%s//%u\n};\n" % (gethex(bytes[length-1]), (i+1)))
	output += ("static const unsigned int %s_size = %u;\n" % (variable, length))

	return output

def usage():
	stderr.write("Usage: %s INPUT VARIABLE OUTPUT\n" % argv[0])

if __name__ == "__main__":
	if len(argv) == 3 or len(argv) == 4:
		output = convert(getbytes(argv[1]), argv[2])

		if len(argv) == 3:
			# Print output
			print output
			exit(0)
		else:
			# Write output to file
			out = open(argv[3], 'w')
			try:
				out.write(output)
			except IOError as e:
				stderr.write("Error writing file: %s\n" % output)
				exit(4)
			else:
				exit(0)
			finally:
				out.close()
	else:
		usage()
		exit(1)