#! /bin/bash
python3 graphc.py
result=$(glpsol -m graph.mod -d graph_colour.dat -o Minwavelen.out)
