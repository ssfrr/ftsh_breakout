PROJNAME=ftsh_breakout
TRACE_TOOL=0.015625 # 1/64
TRACE_OFFSET:=$(shell python -c"print($(TRACE_TOOL) / 2.0)")

DRILL_TOOL=0.03125 # 1/32
DRILL_OFFSET:=$(shell python -c"print($(DRILL_TOOL) / 2.0)")

CUT_TOOL=0.03125 # 1/32
CUT_OFFSET:=$(shell python -c"print($(CUT_TOOL) / 2.0)")

TRACE_GBR=$(PROJNAME)-F_Cu.gbr
OUTLINE_GBR=$(PROJNAME)-Edge_Cuts.gbr
DRILL_FILE=$(PROJNAME).drl 

PCB2GCODE=~/local/src/pcb2gcode/pcb2gcode

default: front.ngc outline.ngc drill.ngc

clean:
	rm -f front.ngc outline.ngc drill.ngc

front.ngc: $(TRACE_GBR) Makefile
	$(PCB2GCODE) --front $< \
		--zwork -0.003 \
		--zsafe 0.02 \
		--zchange 0 \
		--offset $(TRACE_OFFSET) \
		--mill-feed 4.75 \
		--mill-speed 2500 \
		--preamble tool1_preamble.ngc \
		--extra-passes 2

outline.ngc: $(OUTLINE_GBR) Makefile
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
		--zcut -0.067

drill.ngc: $(DRILL_FILE) Makefile
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
		--zdrill -0.067
