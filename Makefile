TOPDIR?=.

CASE?=01_adder_32bits
WAVEFORMS?=fsdbfiles

.PHONY: sim
sim:
	make  flist
	mkdir -p $(TOPDIR)/$(WAVEFORMS)
	vcs -f $(TOPDIR)/$(CASE)/$(CASE).list  \
		-R 						\
		-timescale=1ns/1ns 		\
		+v2k 					\
		-fsdb +define+FSDB					
	mv *.fsdb $(TOPDIR)/$(WAVEFORMS)

.PHONY: flist
flist:
		cd ./$(CASE)/
		find $(TOPDIR)/$(CASE) -name "*.v" > $(TOPDIR)/$(CASE)/$(CASE).list

.PHONY: verdi
verdi:
	mkdir -p $(TOPDIR)/verdifiles
	cd $(TOPDIR)/verdifiles
	verdi -f ./$(CASE)/$(CASE).list


.PHONY: clean
clean:
	rm -rf csrc  novas.conf   novas.rc  novas_dump.log	\
		   simv  simv.daidir  ucli.key  verdiLog		\
		   fsdbfiles

