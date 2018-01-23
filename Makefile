buildDir := code
modules := $(addprefix $(buildDir)/, highcharts highstock)
src := $(addsuffix .src.js, $(modules))
min := $(addsuffix .js, $(modules))

.PHONY : all
all: src min

$(src):
	gulp scripts

.PHONY: src
src: $(src)

%.js : %.src.js
	uglifyjs -c -o $@ $<

.PHONY: min
min: $(min)

.PHONY: clean
clean:
	rm -f $(src)
	rm -f $(min)
