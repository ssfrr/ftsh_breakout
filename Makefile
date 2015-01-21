# Copyright (c) Spencer Russell, MIT Media Lab
#
# Released into the Public Domain. No guarantees about anything.
#

PROJNAME=ftsh_breakout

# Tool Definitions
TRACE_TOOL=0.015625 # 1/64
TRACE_OFFSET:=$(shell python -c"print($(TRACE_TOOL) / 2.0)")
DRILL_TOOL=0.03125 # 1/32
DRILL_OFFSET:=$(shell python -c"print($(DRILL_TOOL) / 2.0)")
CUT_TOOL=0.03125 # 1/32
CUT_OFFSET:=$(shell python -c"print($(CUT_TOOL) / 2.0)")

# Input Gerber Paths
GERBER_DIR=gerbers
TRACE_GBR=$(GERBER_DIR)/$(PROJNAME)-F_Cu.gbr
OUTLINE_GBR=$(GERBER_DIR)/$(PROJNAME)-Edge_Cuts.gbr
DRILL_FILE=$(GERBER_DIR)/$(PROJNAME).drl

# Output Gcode Paths
GCODE_DIR=gcode
TRACE_GCODE=$(GCODE_DIR)/front.ngc
OUTLINE_GCODE=$(GCODE_DIR)/outline.ngc
DRILL_GCODE=$(GCODE_DIR)/drill.ngc

# The pcb2gcode executable to use
PCB2GCODE=~/local/src/pcb2gcode/pcb2gcode

default: $(TRACE_GCODE) $(OUTLINE_GCODE) $(DRILL_GCODE)

clean:
	rm -f $(TRACE_GCODE) $(OUTLINE_GCODE) $(DRILL_GCODE)

$(GCODE_DIR): Makefile
	mkdir -p $(GCODE_DIR)

$(TRACE_GCODE): $(TRACE_GBR) Makefile $(GCODE_DIR)
	$(PCB2GCODE) --front $< \
		--zwork -0.003 \
		--zsafe 0.02 \
		--zchange 0 \
		--offset $(TRACE_OFFSET) \
		--mill-feed 4.75 \
		--mill-speed 2500 \
		--preamble tool1_preamble.ngc \
		--extra-passes 2 \
		--front-output $(TRACE_GCODE)

$(OUTLINE_GCODE): $(OUTLINE_GBR) Makefile $(GCODE_DIR)
	$(PCB2GCODE) --outline $< \
		--zsafe 0.04 \
		--drill-front \
		--cut-infeed 0.02 \
		--drill-speed 2500 \
		--drill-feed 0.945 \
		--cut-feed 4.724 \
		--cut-speed 2500 \
		--zchange 0.5 \
		--cutter-diameter $(CUT_TOOL) \
		--preamble tool2_preamble.ngc \
		--zcut -0.067 \
		--outline-output $(OUTLINE_GCODE)

$(DRILL_GCODE): $(DRILL_FILE) Makefile $(GCODE_DIR)
	$(PCB2GCODE) --drill $< \
		--zsafe 0.04 \
		--drill-front \
		--milldrill \
		--cut-infeed 0.02 \
		--drill-speed 2500 \
		--drill-feed 0.945 \
		--cut-feed 4.724 \
		--cut-speed 2500 \
		--zchange 0.5 \
		--cutter-diameter $(DRILL_TOOL) \
		--zcut -0.067 \
		--preamble tool2_preamble.ngc \
		--zdrill -0.067 \
		--drill-output $(DRILL_GCODE)
