# Authors: Nathan Hoffman (nh662219@ohio.edu)
#          Kara Nemet     (kn485120@ohio.edu)
# 
# Description: Makefile for cs4100 Project2, TreeBuilder Compiler.
# Date: 4/16/2024

# Compile using: make -> make run
# Shortcut Compilation: make all
# Clean up: make clean

# The .PHONY target mark the list of targets
# as none-file.
.PHONY: build run clean all


build: tree_builder
# @echo "build complete."

tree_builder: tree_builder.tab.c lex.yy.c parse_tree.h tree_node.h
# @echo "Building tree_builder..."
	$(CXX) -o $@ $^ -ll

tree_builder.tab.c: tree_builder.y parse_tree.h tree_node.h
# @echo "Building tree_builder.tab.c..."
	bison -d $<
	
lex.yy.c: tree_builder.l 
# @echo "Building lex.yy.c..."
	flex $<

run: tree_builder
# @echo "running..."
	./tree_builder
# @echo "run complete."

clean:
#	@echo "Cleaning up compliation files..."
	-rm -f tree_builder
	-rm -f tree_builder.tab.c
	-rm -f flex.yy.c
# @echo "clean complete."

all: build run