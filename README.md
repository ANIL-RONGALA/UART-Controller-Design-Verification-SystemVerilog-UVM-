# UART Controller Design & Verification (SystemVerilog + UVM)

📌 Overview

This project implements and verifies a memory-mapped UART controller in SystemVerilog using a UVM testbench. It demonstrates full RTL design, integration with UVM components, and verification of complex register-level behavior.

⚙️ Features

UART DUT Design

Synchronous bus interface with clock/reset handling

7 registers: RDR, TDR, CR1, CR2, ISR, ICR, RQR

Data read/write operations with interrupt flag updates

UVM Testbench Components

Driver & Sequencer: Generate constrained-random bus transactions

Monitor: Observes DUT activity and publishes to analysis ports

Scoreboard & Predictor: Compare DUT behavior with reference model

Register Model (RAL): Self-checking sequences for register reads/writes

Callbacks: Validated interrupt clearing, error flag handling

Protocols Verified

Write/read flows to memory-mapped registers

ISR flag behavior during RXNE/TC updates

Proper clearing of flags via RQR and ICR

🛠️ Tech Stack

HDL: SystemVerilog (RTL & UVM)

Verification Methodology: UVM 1.2

Simulator: QuestaSim 2024.3

Key Concepts: Bus protocol verification, RAL, constrained-random stimulus, functional coverage

📊 Results

Simulation logs confirmed correct DUT behavior with multiple register read/write sequences.

Achieved functional coverage closure for UART register map.

Demonstrated self-checking testbench with predictor alignment.
