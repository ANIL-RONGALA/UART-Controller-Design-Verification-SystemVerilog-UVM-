# 🧪 UART Controller Design & Verification

SystemVerilog + UVM Verification Environment

EDA Playground demo: https://edaplayground.com/x/F3b9

This repository contains the RTL design and full UVM verification environment for a UART controller. The intention of this project is to demonstrate a complete design-verification workflow, including register modeling, callbacks, constrained-random testing, functional coverage, and scoreboarding.

The verification environment has been validated using QuestaSim 2024.3_1 and is reproducible both locally and on EDA Playground.

## 📘 1. Project Overview
---
The UART controller supports:

Configurable baud rate

RX/TX data transfer

Interrupt/status registers

FIFO read/write flags

Callback-driven status clearing

Register abstraction using full UVM-RAL

The UVM testbench includes:

Driver, sequencer, monitor, agent

Register model (RAL)

Reg adapter + predictor

Callbacks for register behavior

Sequences for read/write operations

Scoreboard and coverage subscribers

This project demonstrates capability in modern verification methodology and is structured to be extended for protocol-level testing, randomization, and coverage closure.

## 📂 2. Directory Structure
---
```text
uart-uvm-verification/
│
├── rtl/
│   ├── uart_controller.sv
│   ├── uart_tx.sv
│   ├── uart_rx.sv
│   ├── baud_gen.sv
│
├── tb/
│   ├── my_agent.svh
│   ├── my_driver.svh
│   ├── my_monitor.svh
│   ├── my_sequencer.svh
│   ├── my_reg_model.svh
│   ├── my_adapter.svh
│   ├── my_scoreboard.svh
│   ├── my_usart_callback.svh
│   ├── my_reg_cb_seq.svh
│   ├── testbench.sv
│
├── cov/
│   ├── coverage_report.html
│
└── README.md
```

## ⚙️ 3. How to Run (Local QuestaSim)
---
```
qrun -batch \
     -uvmhome uvm-1.2 \
     -access=rw \
     +UVM_TESTNAME=my_test_cb \
     design.sv testbench.sv \
     -do "run -all; exit"
```

The provided run.do or run.sh can also be used.

## 🌐 4. Run Online (EDA Playground)
---
A fully working version of the testbench is available on EDA Playground:

🔗 https://edaplayground.com/x/F3b9

Uses Mentor/Siemens QuestaSim

No installation required

View waveforms online

Modify sequences, RAL, callbacks interactively

This makes it ideal for demonstration, teaching, or remote collaboration.

## 🔍 5. Verification Flow Summary
---
✔ Reset Phase

Driver applies initial reset sequence.

✔ Register Write & Read Sequences

Reg model correctly maps:


RDR

TDR

ISR

RQR

ICR

CR1/CR2 registers

✔ Callbacks

my_usart_callback.svh triggers automatic clearing of:

RXNE (RX Not Empty Flag)

TX Complete Flag

RX FIFO Request bit

✔ Adapter & Predictor

my_adapter.svh translates between RAL transactions and DUT bus protocol.

uvm_reg_predictor correctly updates mirrored register values.

✔ Monitor

Observes bus transactions, sends items to scoreboard.

✔ DUT Behavior

The DUT updates:

RDR after write

ISR flags based on operations

RQR/ICR flags on sequence requests

This is validated by:

monitor

reg predictor

callback

mirrored register values

DUT printed messages

## 🧾 6. Real Simulation Output (Summary)
---
From your Questa log:

0 UVM_FATAL

0 UVM_ERROR

2 minor warnings (one from multiple +UVM_TESTNAME, one from clocking block output)

Test ended cleanly at 545ns

All R/W operations executed correctly

Predictor updates matched expected register behavior

Callback logic successfully cleared flags

Overall, the simulation is fully functional and demonstrates a correct UVM environment.

## 📈 7. Functional Coverage (Current Status)
---
This test (my_test_cb) only exercises register behavior, not full UART protocol timing.

Covered:

RDR read/write

TDR write

ISR flag update

Callback-based clearing

RQR and ICR write sequences

Not Yet Covered:

TX serial bit timing

RX serial sampling

Parity/stop bit combinations

Baud-rate corner cases

FIFO overflow/underflow

Error injection (framing, noise)

Line-turnaround

Achieving 100% functional coverage will require:

additional stimulus sequences

protocol-level modeling

constrained random tests

injected error cases

deeper functional covergroups

## 🧩 8. Known Warnings & Fixes
---
### 1. Clocking block output illegal expression
---

Fix:

Do not read clocking block output signals directly.

### 2. Duplicate +UVM_TESTNAME
---

Fix:

Use only one:

+UVM_TESTNAME=my_test_cb

### 3. +acc deprecation
---

Use:

-access=rw

## 🚀 9. Future Extensions
---
### A. Protocol-Level Verification
---

Add sequences to verify:

TX bit shifting

RX sampling

Stop-bit timing

Parity check logic

Frame errors

### B. Error Injection
---

Test:

baud mismatch

mid-frame data corruption

FIFO overflow

break condition

### C. Loopback Environment
---
Connect UART TX → RX internally to validate full datapath.

### D. Coverage Driven Enhancements
---
Add covergroups for:

parity × stop-bit × baud cross

error combinations

FIFO boundary states

timing-based bins

### E. Scoreboarding Expansion
---

Add packet-level scoreboard for bit-level checking.

## 📌 10. Suggested Repository Name
---
uart-controller-uvm-verification

Professional, descriptive, and ideal for academic visibility.

## 📝 11. Acknowledgments
---
This project was developed as part of advanced digital design verification practice. It reflects practical experience with UVM methodology, RAL models, callbacks, predictor design, and register-level verification.

This project was developed under the academic guidance of Dr. Yuha Chen, Department of Electrical and Computer Engineering, University of Houston.
A small amount of AI assistance was used solely for documentation refinement. All RTL and verification environment work is original

