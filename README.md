# RV32I Single-Cycle RISC-V Processor in Verilog HDL

## Introduction

### What is RISC-V?

RISC-V (Reduced Instruction Set Computer - Five) is an open-standard Instruction Set Architecture (ISA) based on RISC principles. Unlike proprietary architectures such as ARM and x86, RISC-V is open source and royalty-free, allowing researchers, students, startups, and companies to design processors without licensing restrictions.

RISC-V follows a simple and modular design philosophy:

- Small and efficient base instruction set
- Easy hardware implementation
- Extensible architecture
- Open ecosystem for education and industry

Today, RISC-V is being adopted in:

- Embedded Systems
- IoT Devices
- Edge AI Accelerators
- Microcontrollers
- FPGA Prototyping
- Research Processors
- Custom SoCs
- Automotive Electronics

---

### Why RISC-V?

| Feature | RISC-V | ARM | x86 |
|----------|---------|---------|---------|
| Open Source | Yes | No | No |
| Modular ISA | Yes | Limited | No |
| Easy to Learn | Yes | Moderate | Difficult |
| Academic Usage | Excellent | Good | Limited |
| Custom Extensions | Easy | Difficult | Very Difficult |

---

## Project Overview

This project implements a **32-bit Single-Cycle RISC-V Processor** using **Verilog HDL**.

The processor is based on the **RV32I Integer Instruction Set** and follows the **Single-Cycle Datapath Architecture** described in:

> **Computer Organization and Design – RISC-V Edition**  
> **David A. Patterson and John L. Hennessy**

The processor executes one instruction per clock cycle and includes:

- Program Counter (PC)
- Instruction Memory
- Register File
- Immediate Generator
- Control Unit
- ALU Control Unit
- Arithmetic Logic Unit (ALU)
- Data Memory
- Branch Logic
- Multiplexers
- Adders

---

## Scope of This Implementation

The current implementation focuses on understanding and implementing the core components of a Single-Cycle RISC-V Processor.

### Implemented Instruction Categories

#### R-Type Instructions

- ADD
- SUB
- AND
- OR
- XOR
- SLT
- SLL
- SRL
- SRA

#### I-Type Instructions

- ADDI
- ANDI
- ORI
- XORI
- SLTI
- SLLI
- SRLI
- SRAI

#### Memory Instructions

- LW
- SW

#### Branch Instructions

- BEQ

---

## Learning Outcomes

Through this project, I gained practical understanding of:

- RISC-V Instruction Formats
- Instruction Encoding
- Register File Design
- Immediate Generation
- Control Signal Generation
- ALU Design
- Memory Operations
- Branch Instructions
- Processor Datapath Design
- Single-Cycle CPU Architecture
- Verilog RTL Design
- Functional Verification

### Key Concepts Learned

- Why register addresses are 5 bits wide
- Difference between read and write operations
- Difference between LW and SW
- Purpose of branch addresses
- Why B-Type and J-Type immediates append a `0` at the LSB
- Relationship between the Control Unit and ALU Control Unit
- How ALU operations are selected using `ALUOp`, `funct3`, and `funct7`
- How instructions flow through the datapath

---

# Processor Architecture

## Datapath Block Diagram

<img width="800" height="500" alt="Screenshot 2026-06-11 221949" src="https://github.com/user-attachments/assets/2210fbe6-916c-4609-95c0-3428f5850c95" />


---

## Simulation Results

### R-Type Verification

 <img width="750" height="500" alt="Screenshot 2026-06-15 000325" src="https://github.com/user-attachments/assets/3394db6c-d4ee-41e2-982e-432e66c0660f" />
 <img width="750" height="500" alt="Screenshot 2026-06-14 235205" src="https://github.com/user-attachments/assets/d12cf20a-4c9a-4b66-bdbc-10f4565d7b8b" />



### I-Type Verification

 <img width="750" height="500" alt="Screenshot 2026-06-15 002325" src="https://github.com/user-attachments/assets/e37eef9b-96bd-49e9-99a6-25377c95e24a" />
 <img width="750" height="500" alt="image" src="https://github.com/user-attachments/assets/e57f52fa-73ab-44cb-b34f-cdb9bd8811d1" />



### Memory Operations Verification

 <img width="750" height="500" alt="Screenshot 2026-06-15 004610" src="https://github.com/user-attachments/assets/663deddd-b3a3-4f0a-a63f-0e28fd4db0d2" />
 <img width="750" height="500" alt="Screenshot 2026-06-15 004856" src="https://github.com/user-attachments/assets/68353083-5daa-4413-b920-874047952a0b" />



### Branch Verification

 <img width="750" height="500" alt="Screenshot 2026-06-15 010720" src="https://github.com/user-attachments/assets/1b2a5d8b-5fce-45d5-a9c1-82ff5f21be97" />
 <img width="750" height="500" alt="Screenshot 2026-06-15 010754" src="https://github.com/user-attachments/assets/5caf5d25-38ca-483f-89f8-cb5b6e9f162e" />

---

# Implemented Modules

## 1. Program Counter (PC)

### Purpose

Stores the address of the current instruction.

### Inputs

- clk
- reset
- next_pc

### Output

- pc

### Key Points

- Updated on positive clock edge.
- Reset initializes PC to `0`.
- PC normally increments by `4`.

---

## 2. PC + 4 Adder

### Purpose

Calculates the address of the next sequential instruction.

### Formula

```text
PC + 4
```

### Key Points

- Each instruction occupies 4 bytes.
- Used during normal execution.

---

## 3. Instruction Memory

### Purpose

Stores program instructions.

### Key Points

- Read-only memory.
- Addressed using PC.
- Word aligned using:

```verilog
read_addr >> 2
```

---

## 4. Immediate Generator

### Purpose

Extracts immediate values from instructions.

### Supported Formats

- I-Type
- S-Type
- B-Type
- U-Type
- J-Type

### Key Points

- Sign extension performed where required.
- B-Type and J-Type append `0` at LSB.

---

## 5. Register File

### Purpose

Stores processor registers.

### Specifications

- 32 Registers
- 32-bit each

### Key Points

- x0 always remains zero.
- Two read ports.
- One write port.

---

## 6. Control Unit

### Purpose

Generates control signals based on opcode.

### Outputs

- Branch
- MemRead
- MemtoReg
- MemWrite
- ALUSrc
- RegWrite
- ALUOp

---

## 7. ALU Control Unit

### Purpose

Generates ALU operation select signal.

### Inputs

- ALUOp
- funct3
- funct7

### Output

- ALU_sel

---

## 8. Arithmetic Logic Unit (ALU)

### Purpose

Performs arithmetic and logical operations.

### Supported Operations

- ADD
- SUB
- AND
- OR
- XOR
- SLT
- SLL
- SRL
- SRA

---

## 9. Data Memory

### Purpose

Stores program data.

### Key Points

- Supports LW and SW.
- Word-aligned access.

---

## 10. Branch Adder

### Purpose

Calculates branch target address.

### Formula

```text
PC + Immediate
```

---

## 11. Branch Decision Logic

### Purpose

Determines whether a branch should be taken.

### Formula

```text
PCSrc = Branch & Zero
```

---

## 12. Multiplexers

### ALUSrc MUX

Selects between:

- Register Data
- Immediate Value

### MemtoReg MUX

Selects between:

- ALU Result
- Memory Data

### PCSrc MUX

Selects between:

- PC + 4
- Branch Address

---

# Supported Instruction Set

## R-Type Instructions

| Instruction | Description |
|------------|------------|
| ADD | Addition |
| SUB | Subtraction |
| AND | Bitwise AND |
| OR | Bitwise OR |
| XOR | Bitwise XOR |
| SLT | Set Less Than |
| SLL | Shift Left Logical |
| SRL | Shift Right Logical |
| SRA | Shift Right Arithmetic |

---

## I-Type Instructions

| Instruction | Description |
|------------|------------|
| ADDI | Add Immediate |
| ANDI | AND Immediate |
| ORI | OR Immediate |
| XORI | XOR Immediate |
| SLTI | Set Less Than Immediate |
| SLLI | Shift Left Logical Immediate |
| SRLI | Shift Right Logical Immediate |
| SRAI | Shift Right Arithmetic Immediate |

---

## Memory Instructions

| Instruction | Description |
|------------|------------|
| LW | Load Word |
| SW | Store Word |

---

## Branch Instructions

| Instruction | Description |
|------------|------------|
| BEQ | Branch if Equal |

---

# RISC-V Instruction Formats

| Type | Purpose |
|--------|--------|
| R-Type | Register Operations |
| I-Type | Immediate Operations |
| S-Type | Store Instructions |
| B-Type | Branch Instructions |
| U-Type | Upper Immediate |
| J-Type | Jump Instructions |

---

# Opcode Table

| Instruction Type | Opcode |
|------------------|---------|
| R-Type | 0110011 |
| I-Type | 0010011 |
| LW | 0000011 |
| SW | 0100011 |
| BEQ | 1100011 |
| LUI | 0110111 |
| AUIPC | 0010111 |
| JAL | 1101111 |
| JALR | 1100111 |

---

# Control Unit Table

| Instruction | Branch | MemRead | MemtoReg | MemWrite | ALUSrc | RegWrite | ALUOp |
|------------|--------|----------|-----------|-----------|---------|-----------|--------|
| R-Type | 0 | 0 | 0 | 0 | 0 | 1 | 10 |
| I-Type | 0 | 0 | 0 | 0 | 1 | 1 | 11 |
| LW | 0 | 1 | 1 | 0 | 1 | 1 | 00 |
| SW | 0 | 0 | X | 1 | 1 | 0 | 00 |
| BEQ | 1 | 0 | X | 0 | 0 | 0 | 01 |

---

# ALU Operation Table

| ALU_sel | Operation |
|----------|------------|
| 0000 | ADD |
| 0001 | SUB |
| 0010 | AND |
| 0011 | OR |
| 0100 | XOR |
| 0101 | SLT |
| 0110 | SLL |
| 0111 | SRL |
| 1000 | SRA |

---

# ALU Control Mapping

| ALUOp | funct7 | funct3 | Operation |
|--------|---------|---------|-----------|
| 10 | 0 | 000 | ADD |
| 10 | 1 | 000 | SUB |
| 10 | X | 111 | AND |
| 10 | X | 110 | OR |
| 10 | X | 100 | XOR |
| 10 | X | 010 | SLT |
| 10 | X | 001 | SLL |
| 10 | 0 | 101 | SRL |
| 10 | 1 | 101 | SRA |

---

# Future Improvements

The current processor implements a subset of RV32I.

### Additional Branch Instructions

- BNE
- BLT
- BGE
- BLTU
- BGEU

### Jump Instructions

- JAL
- JALR

### Upper Immediate Instructions

- LUI
- AUIPC

### Multiplication and Division (RV32M Extension)

- MUL
- MULH
- DIV
- REM

### Processor Enhancements

- Pipeline Architecture
- Hazard Detection Unit
- Forwarding Unit
- Cache Memory
- Interrupt Handling
- CSR Support

---

# References

1. **Computer Organization and Design – RISC-V Edition**  
   David A. Patterson and John L. Hennessy

2. RISC-V Unprivileged ISA Specification

3. Xilinx Vivado Design Suite Documentation

4. Verilog HDL Documentation

---

# Project Summary

This project successfully implements a **32-bit Single-Cycle RV32I-inspired RISC-V Processor** using **Verilog HDL**. The processor supports arithmetic, logical, memory access, and branch instructions and was verified through extensive simulation.

The implementation provided hands-on understanding of:

- Processor Architecture
- Instruction Execution
- Datapath Design
- Control Signal Generation
- Memory Operations
- Computer Organization Principles

This project serves as a strong foundation for future work involving:

- Pipelined Processors
- Advanced RISC-V Extensions
- FPGA Deployment
- SoC Design
