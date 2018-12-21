GHDLC=ghdl
VCDFILE=../out.vcd
FLAGS=--warn-error --workdir=../
TB_OPTION=--assert-level=error
MODULES=\
	countern \
	decoder
TESTS=\
	countern
OBJS=$(addsuffix .o, ${MODULES})
TESTBENCHES=$(addsuffix _tb, ${TESTS})


.PHONY: all clean open
all: $(OBJS) $(TESTBENCHES)
clean:
	rm -f work-obj93.cf *.o *.vcd
open:
	open out.vcd

%_tb: %_tb.o
	$(GHDLC) -e $(FLAGS) $@
	$(GHDLC) -r ${FLAGS} $@ --vcd=${VCDFILE} ${TB_OPTION}

%.o: %.vhdl
	$(GHDLC) -a $(FLAGS) $<
