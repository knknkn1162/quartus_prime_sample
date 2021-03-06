GHDLC=ghdl
WORKDIR=.
VCDFILE=${WORKDIR}/out.vcd
FLAGS=--warn-error --workdir=${WORKDIR}/
#TB_OPTION=--assert-level=error
MODULES=\
	countern \
	decoder \
	enable_generator \
	secs \
	sec10
TESTS=\
	countern \
	enable_generator \
	secs
OBJS=$(addsuffix .o, ${MODULES})
TESTBENCHES=$(addsuffix _tb, ${TESTS})


.PHONY: all clean open
all: $(OBJS) $(TESTBENCHES)
clean:
	git ls-files --others --ignored --exclude-standard | xargs rm -rfv
open:
	open out.vcd

%_tb: %_tb.o
	$(GHDLC) -e $(FLAGS) $@
	$(GHDLC) -r ${FLAGS} $@ --vcd=${VCDFILE} ${TB_OPTION}

%.o: %.vhdl
	$(GHDLC) -a $(FLAGS) $<
