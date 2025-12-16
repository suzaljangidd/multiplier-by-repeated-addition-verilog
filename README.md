# Multiplier by Repeated Addition (Verilog)

##  Project Overview
This project implements a **Multiplier using Repeated Addition** in **Verilog HDL** based on a **Datapath and Controller (FSM)** architecture.

The multiplication is performed by:
- Loading multiplicand into register **A**
- Loading multiplier into counter **B**
- Repeatedly adding **A** to product register **P**
- Decrementing **B** until it becomes zero
- Generating a **done** signal when multiplication is complete

This project was fully **designed, simulated, debugged, and verified** by me.

---

##  Architecture
- Datapath + Controller separation
- Finite State Machine (FSM) based controller
- Fully synchronous design

### Datapath Blocks
- **PIPO_A** – Register for multiplicand (A)
- **B_CNTR** – Counter for multiplier (B)
- **PIPO_P** – Product register (P)
- **ADD** – Combinational adder
- **EQZ** – Zero comparator for B

### Controller
- FSM controlling datapath signals:
  - `ldA`, `ldB`, `ldP`
  - `clrP`, `decB`
  - `done`

---

## 📁 Folder Structure
Multiplier-by-Repeated-Addition-Verilog
├── rtl/
│ ├── Mul.v # Datapath
│ ├── Mul_Contr.v # Controller (FSM)
│ └── submodules.v # Registers, counter, adder, comparator
│
├── tb/
│ └── Mul_test.v # Testbench
│
├── waveform/
│ └── Mul_waveform.png # GTKWave simulation result
│
├── output/
│ └── terminal_output.png # Terminal simulation output
│
└── README.md

---

## Simulation Details
- **Simulator:** Icarus Verilog
- **Waveform Viewer:** GTKWave
- **Language:** Verilog HDL

### Compile & Run
- iverilog -g 2012 -o mul_out Datapath.v Controller.v Testbench.v
- **vvp mul_out**
- **gtkwave waveform/Mul.vcd**

---

### Example Result
- Input:
A = 5
B = 4

- Output:
  Product (P) = 20

- done = 1

- The result is verified using:

- Terminal output

- GTKWave waveform

---

### Key Learnings

- Datapath and Controller based design

- FSM implementation in Verilog

- Control signal timing and synchronization

- Debugging using waveforms

- Writing effective testbenches

---

### Future Enhancements

- Signed multiplication

- Parameterized bit-width

- Optimized multiplier

- FPGA synthesis

---

### Author

**Suzal Jangid**  
Electronics & Communication Engineering  
**Interest:** RTL Design, Digital Systems, VLSI


⭐ If you found this project useful, feel free to star the repository!

