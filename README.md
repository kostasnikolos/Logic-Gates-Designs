> **Course & Semester:** <Logic Design / Digital Circuits, Semester 4>

## Overview
Small combinational and sequential designs with concise testbenches and waveforms.

## Topics Covered
Combinational blocks (adders/encoders), sequential logic (registers/counters), FSMs (design and simulation).

## How to Simulate
```bash
ghdl -a rtl/*.vhd && ghdl -e tb_top && ghdl -r tb_top --vcd=wave.vcd
