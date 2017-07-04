import sys
for line in sys.stdin:
	try:
		l2 = line.rstrip("\n\r,")
		print('{:.20f} ,'.format(float(l2)))
	except ValueError:
		print("skip\n")
