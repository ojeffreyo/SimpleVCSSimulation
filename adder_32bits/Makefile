.PHONY: sim
sim:
	vcs -f file.list			\
		-R 		  	\
		-timescale=1ns/1ns 		\
		+v2k 			\
		-fsdb +define+FSDB					

.PHONY: flist
flist:
		find -name "*.v" > file.list

.PHONY: verdi
verdi:
	verdi -f file.list


.PHONY: clean
clean:
	rm -rf csrc novas.conf novas.rc novas_dump.log	\
		   simv simv.daidir ucli.key verdiLog
