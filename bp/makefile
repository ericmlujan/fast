###################################################
#
# Makefile for bp
# Creator [Xcode -> Makefile Ver: Feb 14 2007 09:18:41]
# Created: [Fri Jun 14 12:30:33 2013]
#
###################################################

#
# Macros
#


# Make sure that you change your CC to the C compiler that you have installed. GCC is recommended.
CC = /usr/bin/gcc 
CC_OPTIONS = 
LNK_OPTIONS = 


#
# INCLUDE directories for bp
#

INCLUDE = -I.\
		-Isrc


#
# Build bp
#

bp : \
		./main.o
	$(CC) $(LNK_OPTIONS) \
		./main.o\
		-o bp

clean : 
		rm \
		./main.o\
		bp

install : bp
		cp bp /usr/bin/bp

#
# Build the parts of bp
#


# Item # 1 -- main --
./main.o : src/main.c
	$(CC) $(CC_OPTIONS) src/main.c -c $(INCLUDE) -o ./main.o


##### END RUN ####
