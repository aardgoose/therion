# common therion objects
export OUTDIR = .
CMNOBJECTS = thdate.o extern/shpopen.o extern/dbfopen.o \
  thexception.o thbuffer.o thmbuffer.o thlogfile.o thtmpdir.o thlocale.o \
  thparse.o thcmdline.o thconfig.o thinput.o thchenc.o thdatabase.o \
  thdataobject.o thdatareader.o thsurvey.o thendsurvey.o thdata.o \
  thperson.o thtf.o thtfangle.o thtflength.o thtfpwf.o \
  thdataleg.o thobjectname.o thinfnan.o thlayout.o thlookup.o thcomment.o \
  thinit.o thdb1d.o thsvxctrl.o thdatastation.o thobjectid.o \
  thobjectsrc.o thgrade.o thlibrary.o thgeomag.o thbezier.o \
  thexport.o thexporter.o thselector.o extern/img.o \
  thexpmodel.o thdb2d00.o thscrapis.o thcs.o thcsdata.o thexptable.o \
  thdb2d.o thscrap.o thendscrap.o th2ddataobject.o thdb2dprj.o \
  thdb2dpt.o thdb2dlp.o thdb2dab.o thdb2dji.o thdb2dmi.o thdb2dcp.o \
  thdb2dxm.o thdb2dxs.o thscraplo.o thscraplp.o thscrapen.o \
  thpoint.o thline.o tharea.o thlegenddata.o thmpost.o thsymbolsets.o \
  thjoin.o thmap.o thexpmap.o thlayoutln.o thlayoutclr.o thexpsys.o thexpuni.o \
  thconvert.o thpdf.o thpdfdbg.o thpdfdata.o thtexfonts.o \
  thsymbolset.o thlang.o thmapstat.o thexpdb.o thpic.o thsketch.o thproj.o \
  extern/lxMath.o extern/lxFile.o thdb3d.o thsurface.o thimport.o thsvg.o thepsparse.o \
  thtrans.o thwarpp.o thwarppt.o thwarppme.o thwarp.o thexpshp.o thattr.o thtex.o \
  extern/poly2tri/common/shapes.o extern/poly2tri/sweep/advancing_front.o extern/poly2tri/sweep/sweep.o extern/poly2tri/sweep/cdt.o extern/poly2tri/sweep/sweep_context.o \
  therion.o extern/quickhull/QuickHull.o

CROSS =
EXT =

# PLATFORM CONFIG

# PLATFORM LINUX
##CXX = c++
##CC = gcc
##POBJECTS =
##LOCHEXE = loch/loch
##CXXPFLAGS = -DTHLINUX
##CCPFLAGS = -DTHLINUX
##LDPFLAGS = -s
##export THPLATFORM = LINUX
##OUTDIR = $(abspath $(PWD)/../therion.bin)
##THXTHMKCMD = $(OUTDIR)/therion


# PLATFORM DEBIAN
CXX = c++
CC = gcc
POBJECTS =
LOCHEXE = loch/loch
CXXPFLAGS = -DTHLINUX
CCPFLAGS = -DTHLINUX
LDPFLAGS = -s
export THPLATFORM = LINUX
THXTHMKCMD = ./therion


# PLATFORM WIN32
##CXX = c++
##CC = gcc
##POBJECTS = extern/getopt.o extern/getopt1.o therion.res extern/getline.o
##LOCHEXE = loch/loch
##CXXPFLAGS = -DTHWIN32
##CCPFLAGS = -DTHWIN32
##LDPFLAGS = -static-libgcc -static -s
##export THPLATFORM = WIN32
##OUTDIR = $(abspath $(PWD)/../therion.bin)
##THXTHMKCMD = $(OUTDIR)/therion

# PLATFORM WIN32CROSS
##CROSS = i686-w64-mingw32.static-
##EXT = .exe
##CXX = $(CROSS)c++
##export CC = $(CROSS)gcc
##export AR = $(CROSS)ar
##POBJECTS = extern/getopt.o extern/getopt1.o therion.res extern/getline.o
##LOCHEXE = loch/loch
##CXXPFLAGS = -DTHWIN32
##CCPFLAGS = -DTHWIN32
##LDPFLAGS = -static-libgcc -static -s
##export THPLATFORM = WIN32
##THXTHMKCMD = therion
##OUTDIR = $(abspath $(PWD)/../therion.bin)

# PLATFORM MACOSX
##CXX = c++
##CC = cc
##LOCHEXE = loch/loch
##POBJECTS = extern/getopt.o extern/getopt1.o extern/getline.o
##CXXPFLAGS = -DTHMACOSX
##CCPFLAGS = -DTHMACOSX
##LDPFLAGS =
##export THPLATFORM = MACOSX
##THXTHMKCMD = ./therion

# PLATFORM ENDCONFIG


# BUILD CONFIG

# BUILD OZONE
##CCBFLAGS = -O3
##CXXBFLAGS = -O3
##LDBFLAGS = $(LDPFLAGS)

# BUILD OXYGEN
CCBFLAGS = -O2
CXXBFLAGS = -O2
LDBFLAGS = $(LDPFLAGS)

# BUILD RELEASE
##CCBFLAGS =
##CXXBFLAGS =
##LDBFLAGS = $(LDPFLAGS)

# BUILD DEBUG
##CCBFLAGS = -ggdb
##CXXBFLAGS = -ggdb -DTHDEBUG
##LDBFLAGS =

# BUILD ENDCONFIG

# PROJ CONFIG

# PROJ BUNDLED
CMNOBJECTS += extern/proj4/libproj.a
PROJ_LIBS =
PROJ_API_H = extern/proj4/proj_api.h

# PROJ SYSTEM
##PROJ_LIBS = $(shell pkg-config proj --libs)
##PROJ_API_H = $(shell pkg-config proj --variable=includedir)/proj_api.h

# PROJ ENDCONFIG

# compiler settings
CXXFLAGS = -Wall $(CXXPFLAGS) $(CXXBFLAGS) -std=c++11
CCFLAGS = -DIMG_API_VERSION=1 -Wall $(CCPFLAGS) $(CCBFLAGS)
OBJECTS = $(addprefix $(OUTDIR)/,$(POBJECTS)) $(addprefix $(OUTDIR)/,$(CMNOBJECTS))


# linker settings
LIBS = $(PROJ_LIBS)
LDFLAGS = $(LDBFLAGS)


$(OUTDIR)/%.o : %.cxx
	$(CXX) -c $(CXXFLAGS) -o $@ $<

$(OUTDIR)/%.o : %.cpp
	$(CXX) -c $(CXXFLAGS) -o $@ $<

$(OUTDIR)/%.o : %.cc
	$(CXX) -c $(CXXFLAGS) -o $@ $<

$(OUTDIR)/%.o : %.c
	$(CC) -c $(CCFLAGS) -o $@ $<

all: version outdirs $(OUTDIR)/therion doc xtherion/xtherion $(LOCHEXE)

outdirs:
	mkdir -p $(OUTDIR)/extern/poly2tri/sweep/
	mkdir -p $(OUTDIR)/extern/poly2tri/common/
	mkdir -p $(OUTDIR)/extern/quickhull
	mkdir -p $(OUTDIR)/loch
	mkdir -p $(OUTDIR)/xtherion
	mkdir -p $(OUTDIR)/thbook

version:
	python set_version.py


$(OUTDIR)/extern/proj4/libproj.a: extern/proj4/*.c extern/proj4/*.h
	mkdir -p $(OUTDIR)/extern/proj4
	$(MAKE) -C ./extern/proj4

$(OUTDIR)/therion: version $(OBJECTS)
	$(CXX) -Wall -o $(OUTDIR)/therion$(EXT) $(OBJECTS) $(LDFLAGS) $(LIBS)
ifneq ($(THPLATFORM),WIN32)
	$(MAKE) library
	$(MAKE) $(OUTDIR)/thlibrary.o
	$(CXX) -Wall -o $(OUTDIR)/therion$(EXT) $(OBJECTS) $(LDFLAGS) $(LIBS)
endif


$(OUTDIR)/therion.res: therion.rc
	$(CROSS)windres -i therion.rc -J rc -o $(OUTDIR)/therion.res -O coff

init:
	./therion --print-init-file > therion.ini

install: all
	tclsh makeinstall.tcl $(THPLATFORM)

minor-release:
	perl makerelease.pl

archive: config-debian unixify
	perl makearchive2.pl

release: clean
	perl makearchive.pl

binary: all doc
	perl makebinary.pl $(THPLATFORM)

depend:
	perl makedepend.pl > Makefile.dep
	perl maketest.pl Makefile.dep
	perl makefile.pl mv Makefile.dep Makefile
	$(CXX) -MM $(CXXFLAGS) *.cxx >> Makefile
	perl makedepend2.pl

library:
	$(THXTHMKCMD) --print-library-src thlibrarydata.thcfg > thlibrarydata.log
	$(THXTHMKCMD) --print-xtherion-src > xtherion/therion.tcl
	perl makelibrary.pl thlibrarydata.log > thlibrarydata.tmp
	perl maketest.pl thlibrarydata.tmp
	perl makefile.pl mv thlibrarydata.tmp thlibrarydata.cxx

xtherion/xtherion: version xtherion/*.tcl
	$(MAKE) -C ./xtherion

loch/loch: version loch/*.h loch/*.cxx loch/*.c
	$(MAKE) -C ./loch

doc: $(OUTDIR)/thbook/thbook.pdf

thbook: version $(OUTDIR)/thbook/thbook.pdf

samples: $(OUTDIR)/samples.doc/index.tex

$(OUTDIR)/samples.doc/index.tex:
	$(MAKE) -C samples
	touch thbook/version.tex
	$(MAKE) -C thbook

$(OUTDIR)/thbook/thbook.pdf: thbook/*.tex
	$(MAKE) -C thbook

clean:
	perl makefile.pl rm -q thlibrarydata.cxx ./xtherion/therion.tcl
	perl makefile.pl rmdir -q samples.doc
	$(MAKE) -C ./samples clean
	$(MAKE) cleanrest

cleanrest:
	$(MAKE) -C ./xtherion clean
	$(MAKE) -C ./loch clean
	$(MAKE) -C ./extern/proj4 clean
	perl makefile.pl rm -q thmpost.cxx thtex.h thlangdata.h thchencdata.cxx thcsdata.h thmpost.h thcsdata.cxx thtex.cxx thsymbolsetlist.h thsymbolsets.cxx thsymbolsets.h thlangdata.cxx thchencdata.h
	perl makefile.pl rm -q therion ./xtherion/xtherion ./xtherion/xtherion.tcl therion.exe *~ *.log *.o thchencdata/*~ .xtherion.dat ./xtherion/ver.tcl thversion.h thbook/version.tex
	perl makefile.pl rm -q xtherion/*~ .xth_thconfig_xth xtherion/screendump thlang/*~
	perl makefile.pl rm -q extern/*.o extern/*~ extern/poly2tri/common/*.o extern/poly2tri/sweep/*.o samples/*~ samples/*.log
	perl makefile.pl rm -q symbols.html therion.res
	perl makefile.pl rm -q tri/*.o tri/*~
	perl makefile.pl rm -q tex/*~
	perl makefile.pl rm -q us.stackdump loch/us.stackdump samples/us.stackdump xtherion/us.stackdump
	perl makefile.pl rm -q mpost/*~ examples/*~ examples/therion.log
	perl makefile.pl rm -q core symbols.xhtml cave.kml
	perl makefile.pl rm -q data.3d data.svx data.pos data.pts data.err data.plt
	perl makefile.pl rm -q cave.3d cave.lox cave.thm cave.pdf cave.sql cave.xhtml therion.tcl cave_a.pdf cave_m.pdf cave.vrml cave.wrl cave.3dmf cave.svg cave.tlx
	perl makefile.pl rm -q ./thbook/*~ ./thbook/thbook.log ./thbook/thbook.pdf ./lib/*~ ./mpost/*~ ./tex/*~
	perl makefile.pl rmdir -q doc thTMPDIR samples.doc symbols cave.shp tests/.doc
	perl makefile.pl rmdir -q doc symbols cave.shp tests/.doc
	perl makefile.pl rmdir -q thTMPDIR samples/*/thTMPDIR samples/*/*/thTMPDIR

thmpost.h: mpost/*.mp
	$(MAKE) -C ./mpost

thmpost.cxx: mpost/*.mp
	$(MAKE) -C ./mpost

thlibrarydata.cxx:
	perl makefile.pl cp thlibrarydata.src thlibrarydata.cxx

thsymbolsetlist.h: thsymbolsetlist.pl mpost/thTrans.mp
	perl thsymbolsetlist.pl

thtex.h: tex/*.tex
	$(MAKE) -C ./tex

thtex.cxx: tex/*.tex
	$(MAKE) -C ./tex

thchencdata.h: thchencdata/*.TXT
	$(MAKE) -C ./thchencdata

thcsdata.h: thcsdata.tcl
	tclsh thcsdata.tcl

update:
	$(MAKE) -C ./thlang update

unixify: clean
	tclsh makeunixify.tcl

thlangdata.h: thlang/texts.txt
	$(MAKE) -C ./thlang

config-debug:
	perl makeconfig.pl BUILD DEBUG
	$(MAKE) -C ./loch config-debug

config-release:
	perl makeconfig.pl BUILD RELEASE
	$(MAKE) -C ./loch config-release

config-oxygen:
	perl makeconfig.pl BUILD OXYGEN
	$(MAKE) -C ./loch config-oxygen

config-ozone:
	perl makeconfig.pl BUILD OZONE
	$(MAKE) -C ./loch config-ozone

config-debian:
	perl makeconfig.pl PLATFORM DEBIAN
	$(MAKE) -C ./loch config-debian

config-linux:
	perl makeconfig.pl PLATFORM LINUX
	$(MAKE) -C ./loch config-linux

config-win32:
	perl makeconfig.pl PLATFORM WIN32
	$(MAKE) -C ./loch config-win32

config-win32cross:
	perl makeconfig.pl PLATFORM WIN32CROSS
	$(MAKE) -C ./loch config-win32cross

config-macosx:
	perl makeconfig.pl PLATFORM MACOSX
	$(MAKE) -C ./loch config-macosx

# external sources
$(OUTDIR)/extern/lxMath.o: loch/lxMath.h loch/lxMath.cxx
	$(CXX) -c $(CXXFLAGS) -o $(OUTDIR)/extern/lxMath.o loch/lxMath.cxx

$(OUTDIR)/extern/lxFile.o: loch/lxFile.h loch/lxFile.cxx
	$(CXX) -c $(CXXFLAGS) -o $(OUTDIR)/extern/lxFile.o loch/lxFile.cxx

extern/getopt.o: extern/getopt.c extern/getopt.h
extern/getopt1.o: extern/getopt1.c
extern/img.o: extern/img.c extern/img.h
extern/poly2tri/common/shapes.o: extern/poly2tri/common/shapes.cc extern/poly2tri/common/shapes.h
extern/poly2tri/sweep/advancing_front.o: extern/poly2tri/sweep/advancing_front.cc
extern/poly2tri/sweep/sweep.o: extern/poly2tri/sweep/sweep.cc
extern/poly2tri/sweep/cdt.o: extern/poly2tri/sweep/cdt.cc
extern/poly2tri/sweep/sweep_context.o: extern/poly2tri/sweep/sweep_context.cc

# DEPENDENCIES
$(OUTDIR)/th2ddataobject.o: th2ddataobject.cxx th2ddataobject.h thdataobject.h \
 thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h \
 thdataleg.h thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thexception.h thsymbolset.h thsymbolsetlist.h
$(OUTDIR)/tharea.o: tharea.cxx tharea.h th2ddataobject.h thdataobject.h \
 thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h \
 thdataleg.h thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thexception.h thexpmap.h thexport.h thlayout.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h thlang.h thlangdata.h thline.h
$(OUTDIR)/thattr.o: thattr.cxx thattr.h thmbuffer.h thchenc.h thchencdata.h \
 thparse.h thbuffer.h extern/shapefil.h thexception.h therion.h
$(OUTDIR)/thbezier.o: thbezier.cxx thbezier.h
$(OUTDIR)/thbuffer.o: thbuffer.cxx thbuffer.h
$(OUTDIR)/thchenc.o: thchenc.cxx thchenc.h thchencdata.h thparse.h thbuffer.h \
 thmbuffer.h thchencdata.cxx therion.h thexception.h
$(OUTDIR)/thchencdata.o: thchencdata.cxx
$(OUTDIR)/thcmdline.o: thcmdline.cxx thcmdline.h therion.h thlogfile.h thbuffer.h \
 thconfig.h thmbuffer.h thinput.h thparse.h thexporter.h thexport.h \
 thobjectsrc.h thlayout.h thdataobject.h thdatabase.h thdb1d.h \
 thobjectid.h thinfnan.h thdataleg.h thobjectname.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thsymbolset.h thsymbolsetlist.h thlocale.h thselector.h thtmpdir.h \
 extern/getopt.h
$(OUTDIR)/thcomment.o: thcomment.cxx thcomment.h thdataobject.h thdatabase.h \
 thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h \
 thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thdata.h thtfangle.h \
 thtf.h thtflength.h thtfpwf.h thexception.h
$(OUTDIR)/thconfig.o: thconfig.cxx thconfig.h thbuffer.h thmbuffer.h thinput.h \
 thparse.h thexporter.h thexport.h thobjectsrc.h thlayout.h \
 thdataobject.h thdatabase.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h \
 thobjectname.h therion.h thdb3d.h loch/lxMath.h thattr.h thchenc.h \
 thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h thdate.h thperson.h \
 thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h \
 thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h \
 thscrapen.h thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h \
 thselector.h thlang.h thlangdata.h thexception.h thdatareader.h \
 thcsdata.h thproj.h thlogfile.h thinit.h thgeomag.h thgeomagdata.h \
 thcomment.h thdata.h thtfangle.h thtf.h thtflength.h thtfpwf.h \
 thsketch.h thpic.h thcs.h
$(OUTDIR)/thconvert.o: thconvert.cxx thpdfdbg.h thexception.h therion.h thbuffer.h \
 thpdfdata.h thepsparse.h thtexfonts.h
$(OUTDIR)/thcs.o: thcs.cxx thcs.h thcsdata.h thparse.h thbuffer.h thmbuffer.h \
 thexception.h therion.h $(PROJ_API_H) thdatabase.h \
 thdataobject.h thperson.h thdate.h thdataleg.h thobjectname.h \
 thobjectsrc.h thinfnan.h thlayoutclr.h thdb1d.h thobjectid.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thscraplo.h thlayoutln.h \
 thscrapen.h thscraplp.h
$(OUTDIR)/thcsdata.o: thcsdata.cxx thcsdata.h thparse.h thbuffer.h thmbuffer.h
$(OUTDIR)/thdata.o: thdata.cxx thdata.h thdataleg.h thparse.h thbuffer.h \
 thmbuffer.h thobjectname.h therion.h thobjectsrc.h thinfnan.h \
 thdataobject.h thdatabase.h thdb1d.h thobjectid.h thdb3d.h loch/lxMath.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thtfangle.h thtf.h \
 thtflength.h thtfpwf.h thexception.h thsurvey.h thlayout.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h thgrade.h thcsdata.h thdatareader.h \
 thinput.h
$(OUTDIR)/thdatabase.o: thdatabase.cxx thdatabase.h thdataobject.h thperson.h \
 thparse.h thbuffer.h thmbuffer.h thdate.h thdataleg.h thobjectname.h \
 therion.h thobjectsrc.h thinfnan.h thlayoutclr.h thdb1d.h thobjectid.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thsurvey.h thtfpwf.h thendsurvey.h \
 thexception.h thdata.h thtfangle.h thtf.h thtflength.h thcmdline.h \
 thdatastation.h thlookup.h thlocale.h thgrade.h thcomment.h thlayout.h \
 thsymbolset.h thsymbolsetlist.h thscrap.h thsketch.h thpic.h thtrans.h \
 th2ddataobject.h thpoint.h thline.h tharea.h thjoin.h thmap.h thimport.h \
 thsurface.h thendscrap.h
$(OUTDIR)/thdataleg.o: thdataleg.cxx thdataleg.h thparse.h thbuffer.h thmbuffer.h \
 thobjectname.h therion.h thobjectsrc.h thinfnan.h thcs.h thcsdata.h
$(OUTDIR)/thdataobject.o: thdataobject.cxx thdataobject.h thdatabase.h thmbuffer.h \
 thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h thparse.h \
 thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h thattr.h \
 thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h thdate.h \
 thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thexception.h thsurvey.h thtfpwf.h \
 thconfig.h thinput.h thexporter.h thexport.h thlayout.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h thselector.h thcsdata.h thdata.h \
 thtfangle.h thtf.h thtflength.h thproj.h thcs.h
$(OUTDIR)/thdatareader.o: thdatareader.cxx thdatareader.h thdatabase.h \
 thdataobject.h thperson.h thparse.h thbuffer.h thmbuffer.h thdate.h \
 thdataleg.h thobjectname.h therion.h thobjectsrc.h thinfnan.h \
 thlayoutclr.h thdb1d.h thobjectid.h thdb3d.h loch/lxMath.h thattr.h \
 thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h thlegenddata.h \
 thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h \
 thdb2dxs.h thdb2dxm.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thinput.h thexception.h
$(OUTDIR)/thdatastation.o: thdatastation.cxx thdatastation.h thdataobject.h \
 thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h \
 thdataleg.h thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thexception.h
$(OUTDIR)/thdate.o: thdate.cxx thdate.h thparse.h thbuffer.h thmbuffer.h \
 thexception.h therion.h
$(OUTDIR)/thdb1d.o: thdb1d.cxx thdb1d.h thobjectid.h thinfnan.h thdataleg.h \
 thparse.h thbuffer.h thmbuffer.h thobjectname.h therion.h thobjectsrc.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thsurvey.h \
 thdataobject.h thdatabase.h thdb2d.h thdb2dprj.h thmapstat.h thdate.h \
 thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thtfpwf.h thsvxctrl.h thexception.h \
 thdata.h thtfangle.h thtf.h thtflength.h thpoint.h th2ddataobject.h \
 thlogfile.h thsurface.h thlocale.h thinit.h thinput.h thconfig.h \
 thexporter.h thexport.h thlayout.h thsymbolset.h thsymbolsetlist.h \
 thselector.h thtrans.h thcs.h thcsdata.h extern/quickhull/QuickHull.hpp \
 extern/quickhull/Structs/Vector3.hpp extern/quickhull/Structs/Plane.hpp \
 extern/quickhull/Structs/Vector3.hpp extern/quickhull/Structs/Pool.hpp \
 extern/quickhull/Structs/Mesh.hpp extern/quickhull/Structs/Plane.hpp \
 extern/quickhull/Structs/Pool.hpp extern/quickhull/Structs/../Types.hpp \
 extern/quickhull/Structs/VertexDataSource.hpp \
 extern/quickhull/ConvexHull.hpp \
 extern/quickhull/Structs/VertexDataSource.hpp \
 extern/quickhull/HalfEdgeMesh.hpp extern/quickhull/MathUtils.hpp \
 extern/quickhull/Structs/Ray.hpp
$(OUTDIR)/thdb2d.o: thdb2d.cxx thdb2d.h thinfnan.h thdb2dprj.h thparse.h thbuffer.h \
 thmbuffer.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thobjectname.h therion.h thobjectsrc.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thdb1d.h thobjectid.h thdataleg.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thexception.h \
 thdatabase.h thdataobject.h thtfangle.h thtf.h tharea.h th2ddataobject.h \
 thmap.h thjoin.h thpoint.h thline.h thscrap.h thsketch.h thpic.h \
 thtrans.h thsurvey.h thtfpwf.h thlogfile.h thlayout.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h thexpmap.h thexport.h thlang.h thlangdata.h \
 thconfig.h thinput.h thexporter.h thselector.h thtmpdir.h thinit.h
$(OUTDIR)/thdb2d00.o: thdb2d00.cxx thdb2d.h thinfnan.h thdb2dprj.h thparse.h \
 thbuffer.h thmbuffer.h thmapstat.h thdate.h thperson.h thlegenddata.h \
 thdb2dpt.h thdb2dlp.h thdb2dab.h thobjectname.h therion.h thobjectsrc.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thdb1d.h thobjectid.h \
 thdataleg.h thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h \
 thexception.h thdatabase.h thdataobject.h thtfangle.h thtf.h tharea.h \
 th2ddataobject.h thmap.h thjoin.h thpoint.h thline.h thscrap.h \
 thsketch.h thpic.h thtrans.h thsurvey.h thtfpwf.h thlogfile.h thlayout.h \
 thsymbolset.h thsymbolsetlist.h thlocale.h thconfig.h thinput.h \
 thexporter.h thexport.h thselector.h
$(OUTDIR)/thdb2dab.o: thdb2dab.cxx thdb2dab.h thobjectname.h thmbuffer.h therion.h \
 thobjectsrc.h
$(OUTDIR)/thdb2dcp.o: thdb2dcp.cxx thdb2dcp.h thdb2dpt.h
$(OUTDIR)/thdb2dji.o: thdb2dji.cxx thdb2dji.h thobjectname.h thmbuffer.h therion.h \
 thdatabase.h thdataobject.h thperson.h thparse.h thbuffer.h thdate.h \
 thdataleg.h thobjectsrc.h thinfnan.h thlayoutclr.h thdb1d.h thobjectid.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thscraplo.h thlayoutln.h \
 thscrapen.h thscraplp.h thexception.h
$(OUTDIR)/thdb2dlp.o: thdb2dlp.cxx thdb2dlp.h thdb2dpt.h thline.h th2ddataobject.h \
 thdataobject.h thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h \
 thinfnan.h thdataleg.h thparse.h thobjectname.h therion.h thobjectsrc.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thexpmap.h thexport.h \
 thlayout.h thsymbolset.h thsymbolsetlist.h thlocale.h thlang.h \
 thlangdata.h
$(OUTDIR)/thdb2dmi.o: thdb2dmi.cxx thdb2dmi.h thobjectname.h thmbuffer.h therion.h \
 thobjectsrc.h thparse.h thbuffer.h thexception.h
$(OUTDIR)/thdb2dprj.o: thdb2dprj.cxx thdb2dprj.h thparse.h thbuffer.h thmbuffer.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thinfnan.h
$(OUTDIR)/thdb2dpt.o: thdb2dpt.cxx thdb2dpt.h thexpmap.h thexport.h thparse.h \
 thbuffer.h thmbuffer.h thobjectsrc.h thlayout.h thdataobject.h \
 thdatabase.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h \
 therion.h thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h \
 thdb2d.h thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h thlang.h \
 thlangdata.h
$(OUTDIR)/thdb2dxm.o: thdb2dxm.cxx thdb2dxm.h thdb2dmi.h thobjectname.h thmbuffer.h \
 therion.h thobjectsrc.h thparse.h thbuffer.h thlayoutclr.h
$(OUTDIR)/thdb2dxs.o: thdb2dxs.cxx thdb2dxs.h thdb2dmi.h thobjectname.h thmbuffer.h \
 therion.h thobjectsrc.h thparse.h thbuffer.h
$(OUTDIR)/thdb3d.o: thdb3d.cxx thdb3d.h loch/lxMath.h
$(OUTDIR)/thendscrap.o: thendscrap.cxx thendscrap.h thdataobject.h thdatabase.h \
 thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h \
 thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thexception.h
$(OUTDIR)/thendsurvey.o: thendsurvey.cxx thendsurvey.h thdataobject.h thdatabase.h \
 thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h \
 thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thexception.h
$(OUTDIR)/thepsparse.o: thepsparse.cxx thepsparse.h thpdfdbg.h thexception.h \
 therion.h thbuffer.h thpdfdata.h thtexfonts.h thconvert.h
$(OUTDIR)/therion.o: therion.cxx therion.h thlogfile.h thbuffer.h thtmpdir.h \
 thcmdline.h thconfig.h thmbuffer.h thinput.h thparse.h thexporter.h \
 thexport.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h thdb1d.h \
 thobjectid.h thinfnan.h thdataleg.h thobjectname.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thsymbolset.h thsymbolsetlist.h thlocale.h thselector.h thdatareader.h \
 thexception.h thlibrary.h thinit.h thgrade.h thdata.h thtfangle.h thtf.h \
 thtflength.h thtfpwf.h thpoint.h th2ddataobject.h thline.h tharea.h \
 thversion.h thtexfonts.h thlang.h thlangdata.h thbezier.h
$(OUTDIR)/thexception.o: thexception.cxx thexception.h therion.h thbuffer.h
$(OUTDIR)/thexpdb.o: thexpdb.cxx thexpdb.h thexport.h thparse.h thbuffer.h \
 thmbuffer.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h \
 thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h thexception.h \
 thscrap.h thsketch.h thpic.h thtrans.h thmap.h thdata.h thtfangle.h \
 thtf.h thtflength.h thtfpwf.h thinit.h thinput.h thsurvey.h
$(OUTDIR)/thexpmap.o: thexpmap.cxx thexpmap.h thexport.h thparse.h thbuffer.h \
 thmbuffer.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h \
 thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h thlang.h \
 thlangdata.h thexporter.h thexception.h thtmpdir.h thscrap.h thsketch.h \
 thpic.h thtrans.h thpoint.h th2ddataobject.h thline.h tharea.h thmap.h \
 thconfig.h thinput.h thselector.h thlookup.h thinit.h thlogfile.h \
 thconvert.h thpdf.h thpdfdata.h thepsparse.h thmpost.h thtex.h \
 thcmdline.h thtexfonts.h thsurvey.h thtfpwf.h thcsdata.h thproj.h \
 thsurface.h thtflength.h thtf.h thsvg.h extern/img.h thcs.h
$(OUTDIR)/thexpmodel.o: thexpmodel.cxx thexpmodel.h thexport.h thparse.h thbuffer.h \
 thmbuffer.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h \
 thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h thsurvey.h \
 thtfpwf.h thexception.h thdata.h thtfangle.h thtf.h thtflength.h \
 extern/img.h thscrap.h thsketch.h thpic.h thtrans.h thsurface.h \
 loch/lxFile.h thconfig.h thinput.h thexporter.h thselector.h thcsdata.h \
 thproj.h thcs.h thtexfonts.h thlang.h thlangdata.h
$(OUTDIR)/thexport.o: thexport.cxx thexport.h thparse.h thbuffer.h thmbuffer.h \
 thobjectsrc.h thlayout.h thdataobject.h thdatabase.h thdb1d.h \
 thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thsymbolset.h thsymbolsetlist.h thlocale.h thexception.h thconfig.h \
 thinput.h thexporter.h thselector.h thcs.h thcsdata.h
$(OUTDIR)/thexporter.o: thexporter.cxx thexporter.h thexport.h thparse.h thbuffer.h \
 thmbuffer.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h \
 thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h thexception.h \
 thconfig.h thinput.h thselector.h thexpmodel.h thsurvey.h thtfpwf.h \
 thexpmap.h thlang.h thlangdata.h thexpdb.h thexpsys.h thexptable.h
$(OUTDIR)/thexpshp.o: thexpshp.cxx thexpmap.h thexport.h thparse.h thbuffer.h \
 thmbuffer.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h \
 thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h thlang.h \
 thlangdata.h thexporter.h thexception.h thmap.h thsketch.h thpic.h \
 thconfig.h thinput.h thselector.h thtmpdir.h thinit.h thlogfile.h \
 thcmdline.h thsurvey.h thtfpwf.h thsurface.h thtflength.h thtf.h \
 extern/shapefil.h thexpmodel.h thcsdata.h thcs.h thexpshp.h thscrap.h \
 thtrans.h thpoint.h th2ddataobject.h thline.h tharea.h
$(OUTDIR)/thexpsys.o: thexpsys.cxx thexpsys.h thexport.h thparse.h thbuffer.h \
 thmbuffer.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h \
 thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h thexception.h
$(OUTDIR)/thexptable.o: thexptable.cxx thexptable.h thexport.h thparse.h thbuffer.h \
 thmbuffer.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h \
 thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h thexception.h \
 thdata.h thtfangle.h thtf.h thtflength.h thtfpwf.h thexporter.h thinit.h \
 thinput.h thsurvey.h thscrap.h thsketch.h thpic.h thtrans.h thpoint.h \
 th2ddataobject.h thcsdata.h thproj.h thconfig.h thselector.h thcs.h \
 thtexfonts.h thlang.h thlangdata.h
$(OUTDIR)/thexpuni.o: thexpuni.cxx thexpmap.h thexport.h thparse.h thbuffer.h \
 thmbuffer.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h \
 thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thsymbolset.h thsymbolsetlist.h thlocale.h thlang.h \
 thlangdata.h thexporter.h thexception.h thmap.h thsketch.h thpic.h \
 thconfig.h thinput.h thselector.h thtmpdir.h thcsdata.h thinit.h \
 thlogfile.h thcmdline.h thsurvey.h thtfpwf.h thsurface.h thtflength.h \
 thtf.h extern/shapefil.h thexpmodel.h thexpuni.h thscrap.h thtrans.h \
 thpoint.h th2ddataobject.h thline.h tharea.h thproj.h thcs.h \
 thtexfonts.h
$(OUTDIR)/thgeomag.o: thgeomag.cxx thgeomagdata.h
$(OUTDIR)/thgrade.o: thgrade.cxx thgrade.h thdataobject.h thdatabase.h thmbuffer.h \
 thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h thparse.h \
 thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h thattr.h \
 thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h thdate.h \
 thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thdata.h thtfangle.h thtf.h \
 thtflength.h thtfpwf.h thexception.h
$(OUTDIR)/thimport.o: thimport.cxx thimport.h thdataobject.h thdatabase.h \
 thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h \
 thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thexception.h thdata.h \
 thtfangle.h thtf.h thtflength.h thtfpwf.h thsurvey.h thendsurvey.h \
 extern/img.h
$(OUTDIR)/thinfnan.o: thinfnan.cxx thinfnan.h
$(OUTDIR)/thinit.o: thinit.cxx thinit.h thbuffer.h thmbuffer.h thinput.h thparse.h \
 thchenc.h thchencdata.h therion.h thconfig.h thexporter.h thexport.h \
 thobjectsrc.h thlayout.h thdataobject.h thdatabase.h thdb1d.h \
 thobjectid.h thinfnan.h thdataleg.h thobjectname.h thdb3d.h \
 loch/lxMath.h thattr.h thdb2d.h thdb2dprj.h thmapstat.h thdate.h \
 thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thsymbolset.h thsymbolsetlist.h \
 thlocale.h thselector.h thexception.h thtexfonts.h thlang.h thlangdata.h \
 thtmpdir.h thcs.h thcsdata.h
$(OUTDIR)/thinput.o: thinput.cxx thinput.h thbuffer.h thmbuffer.h thparse.h \
 thchenc.h thchencdata.h therion.h thexception.h
$(OUTDIR)/thjoin.o: thjoin.cxx thjoin.h thdataobject.h thdatabase.h thmbuffer.h \
 thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h thparse.h \
 thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h thattr.h \
 thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h thdate.h \
 thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thexception.h
$(OUTDIR)/thlang.o: thlang.cxx thlang.h thlangdata.h thparse.h thbuffer.h \
 thmbuffer.h thlangdata.cxx thinit.h thinput.h thconfig.h thexporter.h \
 thexport.h thobjectsrc.h thlayout.h thdataobject.h thdatabase.h thdb1d.h \
 thobjectid.h thinfnan.h thdataleg.h thobjectname.h therion.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thsymbolset.h thsymbolsetlist.h thlocale.h thselector.h thexception.h
$(OUTDIR)/thlangdata.o: thlangdata.cxx
$(OUTDIR)/thlayout.o: thlayout.cxx thlayout.h thdataobject.h thdatabase.h \
 thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h \
 thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h thlookup.h thexception.h thdata.h \
 thtfangle.h thtf.h thtflength.h thtfpwf.h thpdfdata.h thepsparse.h \
 thlang.h thlangdata.h thcsdata.h thconfig.h thinput.h thexporter.h \
 thexport.h thselector.h th2ddataobject.h
$(OUTDIR)/thlayoutclr.o: thlayoutclr.cxx thlayoutclr.h thparse.h thbuffer.h \
 thmbuffer.h thdatabase.h thdataobject.h thperson.h thdate.h thdataleg.h \
 thobjectname.h therion.h thobjectsrc.h thinfnan.h thdb1d.h thobjectid.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thexception.h
$(OUTDIR)/thlayoutln.o: thlayoutln.cxx thlayoutln.h thlayoutclr.h thlayout.h \
 thdataobject.h thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h \
 thinfnan.h thdataleg.h thparse.h thobjectname.h therion.h thobjectsrc.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thscraplo.h thscrapen.h thscraplp.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h
$(OUTDIR)/thlegenddata.o: thlegenddata.cxx thlegenddata.h
$(OUTDIR)/thlibrary.o: thlibrary.cxx thlibrary.h thlibrarydata.cxx
$(OUTDIR)/thlibrarydata.o: thlibrarydata.cxx
$(OUTDIR)/thline.o: thline.cxx thline.h th2ddataobject.h thdataobject.h \
 thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h \
 thdataleg.h thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thexception.h thexpmap.h thexport.h thlayout.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h thlang.h thlangdata.h thtflength.h thtf.h \
 thtexfonts.h thscrap.h thsketch.h thpic.h thtrans.h
$(OUTDIR)/thlocale.o: thlocale.cxx thlocale.h thparse.h thbuffer.h thmbuffer.h \
 thexception.h therion.h thlang.h thlangdata.h thinit.h thinput.h
$(OUTDIR)/thlogfile.o: thlogfile.cxx thlogfile.h thbuffer.h therion.h
$(OUTDIR)/thlookup.o: thlookup.cxx thlookup.h thdataobject.h thdatabase.h \
 thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h \
 thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thlocale.h \
 thexception.h thdata.h thtfangle.h thtf.h thtflength.h thtfpwf.h \
 thpdfdata.h thepsparse.h thsymbolset.h thsymbolsetlist.h thlang.h \
 thlangdata.h thcsdata.h thconfig.h thinput.h thexporter.h thexport.h \
 thlayout.h thselector.h thscrap.h thsketch.h thpic.h thtrans.h thmap.h \
 thpdf.h thtexfonts.h
$(OUTDIR)/thmap.o: thmap.cxx thmap.h thdataobject.h thdatabase.h thmbuffer.h \
 thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h thparse.h \
 thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h thattr.h \
 thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h thdate.h \
 thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thexception.h thscrap.h thsketch.h \
 thpic.h thtrans.h thtflength.h thtf.h
$(OUTDIR)/thmapstat.o: thmapstat.cxx thmapstat.h thdate.h thperson.h thlegenddata.h \
 thscrap.h thdataobject.h thdatabase.h thmbuffer.h thbuffer.h thdb1d.h \
 thobjectid.h thinfnan.h thdataleg.h thparse.h thobjectname.h therion.h \
 thobjectsrc.h thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h \
 thdb2d.h thdb2dprj.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thsketch.h thpic.h thtrans.h \
 thdata.h thtfangle.h thtf.h thtflength.h thtfpwf.h thmap.h thlayout.h \
 thsymbolset.h thsymbolsetlist.h thlocale.h thlang.h thlangdata.h \
 thversion.h thtexfonts.h thsurvey.h thconfig.h thinput.h thexporter.h \
 thexport.h thselector.h thcs.h thcsdata.h
$(OUTDIR)/thmbuffer.o: thmbuffer.cxx thmbuffer.h
$(OUTDIR)/thmpost.o: thmpost.cxx thmpost.h
$(OUTDIR)/thobjectid.o: thobjectid.cxx thobjectid.h
$(OUTDIR)/thobjectname.o: thobjectname.cxx thobjectname.h thmbuffer.h therion.h \
 thexception.h thbuffer.h thparse.h thdatabase.h thdataobject.h \
 thperson.h thdate.h thdataleg.h thobjectsrc.h thinfnan.h thlayoutclr.h \
 thdb1d.h thobjectid.h thdb3d.h loch/lxMath.h thattr.h thchenc.h \
 thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thsurvey.h \
 thtfpwf.h
$(OUTDIR)/thobjectsrc.o: thobjectsrc.cxx thobjectsrc.h
$(OUTDIR)/thparse.o: thparse.cxx thparse.h thbuffer.h thmbuffer.h therion.h \
 thlang.h thlangdata.h thtexfonts.h thinfnan.h thdatabase.h \
 thdataobject.h thperson.h thdate.h thdataleg.h thobjectname.h \
 thobjectsrc.h thlayoutclr.h thdb1d.h thobjectid.h thdb3d.h loch/lxMath.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h \
 thdb2dcp.h thdb2dxs.h thdb2dxm.h thscraplo.h thlayoutln.h thscrapen.h \
 thscraplp.h thtflength.h thtf.h thexception.h
$(OUTDIR)/thpdf.o: thpdf.cxx thpdfdbg.h thexception.h therion.h thbuffer.h \
 thpdfdata.h thepsparse.h thtexfonts.h thlang.h thlangdata.h thparse.h \
 thmbuffer.h thversion.h thchenc.h thchencdata.h
$(OUTDIR)/thpdfdata.o: thpdfdata.cxx thpdfdata.h thepsparse.h thlang.h thlangdata.h \
 thparse.h thbuffer.h thmbuffer.h
$(OUTDIR)/thpdfdbg.o: thpdfdbg.cxx thpdfdbg.h thexception.h therion.h thbuffer.h \
 thpdfdata.h thepsparse.h
$(OUTDIR)/thperson.o: thperson.cxx thperson.h thdatabase.h thdataobject.h thparse.h \
 thbuffer.h thmbuffer.h thdate.h thdataleg.h thobjectname.h therion.h \
 thobjectsrc.h thinfnan.h thlayoutclr.h thdb1d.h thobjectid.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thscraplo.h thlayoutln.h \
 thscrapen.h thscraplp.h thexception.h
$(OUTDIR)/thpic.o: thpic.cxx thpic.h thbuffer.h thdatabase.h thdataobject.h \
 thperson.h thparse.h thmbuffer.h thdate.h thdataleg.h thobjectname.h \
 therion.h thobjectsrc.h thinfnan.h thlayoutclr.h thdb1d.h thobjectid.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thinit.h thinput.h thtmpdir.h \
 thexception.h
$(OUTDIR)/thpoint.o: thpoint.cxx thpoint.h th2ddataobject.h thdataobject.h \
 thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h \
 thdataleg.h thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thexception.h thexpmap.h thexport.h thlayout.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h thlang.h thlangdata.h thtflength.h thtf.h \
 thtexfonts.h thscrap.h thsketch.h thpic.h thtrans.h
$(OUTDIR)/thproj.o: thproj.cxx thexception.h therion.h thbuffer.h \
 $(PROJ_API_H)
$(OUTDIR)/thscrap.o: thscrap.cxx thscrap.h thdataobject.h thdatabase.h thmbuffer.h \
 thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h thparse.h \
 thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h thattr.h \
 thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h thdate.h \
 thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thsketch.h thpic.h thtrans.h \
 thexception.h thtflength.h thtf.h th2ddataobject.h thline.h thpoint.h \
 thscrapis.h thsurvey.h thtfpwf.h thsymbolset.h thsymbolsetlist.h \
 thcsdata.h
$(OUTDIR)/thscrapen.o: thscrapen.cxx thscrapen.h
$(OUTDIR)/thscrapis.o: thscrapis.cxx thscrapis.h thdb3d.h loch/lxMath.h thscrap.h \
 thdataobject.h thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h \
 thinfnan.h thdataleg.h thparse.h thobjectname.h therion.h thobjectsrc.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thsketch.h thpic.h \
 thtrans.h thpoint.h th2ddataobject.h thline.h thconfig.h thinput.h \
 thexporter.h thexport.h thlayout.h thsymbolset.h thsymbolsetlist.h \
 thlocale.h thselector.h extern/poly2tri/poly2tri.h \
 extern/poly2tri/common/shapes.h extern/poly2tri/sweep/cdt.h \
 extern/poly2tri/sweep/advancing_front.h \
 extern/poly2tri/sweep/../common/shapes.h \
 extern/poly2tri/sweep/sweep_context.h extern/poly2tri/sweep/sweep.h \
 thsurvey.h thtfpwf.h
$(OUTDIR)/thscraplo.o: thscraplo.cxx thscraplo.h
$(OUTDIR)/thscraplp.o: thscraplp.cxx thscraplp.h thdb1d.h thobjectid.h thinfnan.h \
 thdataleg.h thparse.h thbuffer.h thmbuffer.h thobjectname.h therion.h \
 thobjectsrc.h thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h \
 thscrap.h thdataobject.h thdatabase.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thsketch.h thpic.h thtrans.h \
 thexpmap.h thexport.h thlayout.h thsymbolset.h thsymbolsetlist.h \
 thlocale.h thlang.h thlangdata.h
$(OUTDIR)/thselector.o: thselector.cxx thselector.h thlayoutclr.h thexception.h \
 therion.h thbuffer.h thconfig.h thmbuffer.h thinput.h thparse.h \
 thexporter.h thexport.h thobjectsrc.h thlayout.h thdataobject.h \
 thdatabase.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h thobjectname.h \
 thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h \
 thdb2dprj.h thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h \
 thdb2dlp.h thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h \
 thdb2dxm.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h \
 thsymbolset.h thsymbolsetlist.h thlocale.h thsurvey.h thtfpwf.h \
 th2ddataobject.h thscrap.h thsketch.h thpic.h thtrans.h thmap.h
$(OUTDIR)/thsketch.o: thsketch.cxx therion.h thsketch.h thpic.h thscrap.h \
 thdataobject.h thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h \
 thinfnan.h thdataleg.h thparse.h thobjectname.h thobjectsrc.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thtrans.h \
 thwarpp.h thwarp.h thwarppme.h thwarppdef.h thwarppt.h thconfig.h \
 thinput.h thexporter.h thexport.h thlayout.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h thselector.h
$(OUTDIR)/thsurface.o: thsurface.cxx thsurface.h thdb3d.h loch/lxMath.h \
 thdataobject.h thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h \
 thinfnan.h thdataleg.h thparse.h thobjectname.h therion.h thobjectsrc.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thtflength.h thtf.h \
 thexception.h thcsdata.h thdatareader.h thinput.h
$(OUTDIR)/thsurvey.o: thsurvey.cxx thsurvey.h thdataobject.h thdatabase.h \
 thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thinfnan.h thdataleg.h \
 thparse.h thobjectname.h therion.h thobjectsrc.h thdb3d.h loch/lxMath.h \
 thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h \
 thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h \
 thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thtfpwf.h thexception.h \
 thtfangle.h thtf.h thdata.h thtflength.h
$(OUTDIR)/thsvg.o: thsvg.cxx thepsparse.h thpdfdbg.h thexception.h therion.h \
 thbuffer.h thpdfdata.h thversion.h thlegenddata.h thtexfonts.h
$(OUTDIR)/thsvxctrl.o: thsvxctrl.cxx thsvxctrl.h thdataleg.h thparse.h thbuffer.h \
 thmbuffer.h thobjectname.h therion.h thobjectsrc.h thinfnan.h \
 thdatabase.h thdataobject.h thperson.h thdate.h thlayoutclr.h thdb1d.h \
 thobjectid.h thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h \
 thdb2d.h thdb2dprj.h thmapstat.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thtmpdir.h thdata.h \
 thtfangle.h thtf.h thtflength.h thtfpwf.h thexception.h thinit.h \
 thinput.h thconfig.h thexporter.h thexport.h thlayout.h thsymbolset.h \
 thsymbolsetlist.h thlocale.h thselector.h thsurvey.h thcs.h thcsdata.h \
 thlogfile.h extern/img.h
$(OUTDIR)/thsymbolset.o: thsymbolset.cxx thsymbolset.h thsymbolsetlist.h \
 thlayoutclr.h thparse.h thbuffer.h thmbuffer.h thpoint.h \
 th2ddataobject.h thdataobject.h thdatabase.h thdb1d.h thobjectid.h \
 thinfnan.h thdataleg.h thobjectname.h therion.h thobjectsrc.h thdb3d.h \
 loch/lxMath.h thattr.h thchenc.h thchencdata.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thline.h tharea.h \
 thexception.h thpdfdata.h thepsparse.h thlayout.h thlocale.h \
 thtexfonts.h thlang.h thlangdata.h thtmpdir.h thcmdline.h thmpost.h \
 thinit.h thinput.h thsymbolsets.h thlogfile.h
$(OUTDIR)/thsymbolsets.o: thsymbolsets.cxx thsymbolsets.h thsymbolsetlist.h
$(OUTDIR)/thtex.o: thtex.cxx thtex.h
$(OUTDIR)/thtexenc.o: thtexenc.cxx
$(OUTDIR)/thtexfonts.o: thtexfonts.cxx thtexfonts.h thtexenc.cxx thpdfdbg.h \
 thexception.h therion.h thbuffer.h thinit.h thmbuffer.h thinput.h \
 thparse.h thpdfdata.h thepsparse.h
$(OUTDIR)/thtf.o: thtf.cxx thtf.h thexception.h therion.h thbuffer.h thparse.h \
 thmbuffer.h
$(OUTDIR)/thtfangle.o: thtfangle.cxx thparse.h thbuffer.h thmbuffer.h thtfangle.h \
 thtf.h thexception.h therion.h thinfnan.h
$(OUTDIR)/thtflength.o: thtflength.cxx thtflength.h thtf.h thparse.h thbuffer.h \
 thmbuffer.h thexception.h therion.h
$(OUTDIR)/thtfpwf.o: thtfpwf.cxx thtfpwf.h thexception.h therion.h thbuffer.h \
 thinfnan.h thparse.h thmbuffer.h
$(OUTDIR)/thtmpdir.o: thtmpdir.cxx thtmpdir.h thbuffer.h therion.h thinit.h \
 thmbuffer.h thinput.h thparse.h
$(OUTDIR)/thtrans.o: thtrans.cxx thtrans.h thinfnan.h thdatabase.h thdataobject.h \
 thperson.h thparse.h thbuffer.h thmbuffer.h thdate.h thdataleg.h \
 thobjectname.h therion.h thobjectsrc.h thlayoutclr.h thdb1d.h \
 thobjectid.h thdb3d.h loch/lxMath.h thattr.h thchenc.h thchencdata.h \
 thdb2d.h thdb2dprj.h thmapstat.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thscraplo.h thlayoutln.h thscrapen.h thscraplp.h
$(OUTDIR)/thwarp.o: thwarp.cxx thwarp.h thpic.h thsketch.h thdb1d.h thobjectid.h \
 thinfnan.h thdataleg.h thparse.h thbuffer.h thmbuffer.h thobjectname.h \
 therion.h thobjectsrc.h thdb3d.h loch/lxMath.h thattr.h thchenc.h \
 thchencdata.h thscrap.h thdataobject.h thdatabase.h thdb2d.h thdb2dprj.h \
 thmapstat.h thdate.h thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h \
 thdb2dab.h thdb2dji.h thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h \
 thlayoutclr.h thscraplo.h thlayoutln.h thscrapen.h thscraplp.h thtrans.h \
 th2ddataobject.h thpoint.h thconfig.h thinput.h thexporter.h thexport.h \
 thlayout.h thsymbolset.h thsymbolsetlist.h thlocale.h thselector.h
$(OUTDIR)/thwarpp.o: thwarpp.cxx thwarpp.h thwarp.h thpic.h thsketch.h thwarppme.h \
 thwarppdef.h therion.h thtrans.h thinfnan.h thwarppt.h thdataobject.h \
 thdatabase.h thmbuffer.h thbuffer.h thdb1d.h thobjectid.h thdataleg.h \
 thparse.h thobjectname.h thobjectsrc.h thdb3d.h loch/lxMath.h thattr.h \
 thchenc.h thchencdata.h thdb2d.h thdb2dprj.h thmapstat.h thdate.h \
 thperson.h thlegenddata.h thdb2dpt.h thdb2dlp.h thdb2dab.h thdb2dji.h \
 thdb2dmi.h thdb2dcp.h thdb2dxs.h thdb2dxm.h thlayoutclr.h thscraplo.h \
 thlayoutln.h thscrapen.h thscraplp.h thscrap.h th2ddataobject.h \
 thpoint.h thconfig.h thinput.h thexporter.h thexport.h thlayout.h \
 thsymbolset.h thsymbolsetlist.h thlocale.h thselector.h
$(OUTDIR)/thwarppme.o: thwarppme.cxx thinfnan.h thwarppme.h thwarppdef.h therion.h \
 thtrans.h
$(OUTDIR)/thwarppt.o: thwarppt.cxx thwarppt.h thtrans.h thinfnan.h thwarppme.h \
 thwarppdef.h therion.h
