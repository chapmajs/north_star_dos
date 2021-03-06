North Star DOS Patches and Utilities
====================================

This repository contains patches and utilities I've created for North Star DOS. They've been tested under North Star DOS 5.1S as that's what I use.

###io_routines

Console I/O routines for personalizing North Star DOS. Includes routines for:

* [Dajen SCI](http://www.glitchwrks.com/2011/11/03/Dajen-SCI/)
* [N8VEM/s100computers.com Serial IO](http://www.s100computers.com/My%20System%20Pages/Serial%20IO%20Board/Serial%20IO%20Board.htm)

These routines assemble properly under [GNUSim8085](http://gnusim8085.org/) with a starting address of `0x2900`. Standard Intel mnemonics are used, so modification for use with other assemblers should be trivial. No Z80 instructions. Don't forget to patch the jump table!

###nst

I/O routines for Dave Dunfield's [North Star Transfer](http://www.classiccmp.org/dunfield/img/index.htm) disk imaging utility. These routines replace the standard North Star Horizon routines found in Dave's original NST.ASM included in the NST archive. Z80 mnemonics are used but code is 8080 compatible. These I/O routines should assemble with Dave's included Z80 assembler under MS-DOS.

The following NST I/O routines are included:

* [Dajen SCI](http://www.glitchwrks.com/2011/11/03/Dajen-SCI/)
* [N8VEM/s100computers.com Serial IO](http://www.s100computers.com/My%20System%20Pages/Serial%20IO%20Board/Serial%20IO%20Board.htm)
