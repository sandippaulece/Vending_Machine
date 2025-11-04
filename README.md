# 💡 Vending Machine FSM (Verilog)

## 🧩 Project Overview  
This project implements a **Vending Machine** using a **Finite State Machine (FSM)** in **Verilog HDL**.  
The vending machine dispenses a product worth **₹15**, accepting coins of **₹5** and **₹10**, and returns change when extra money is inserted.

---

## ⚙️ Inputs and Outputs  

### 🔹 Inputs  
| Signal | Width | Description |
|--------|--------|-------------|
| `clk` | 1 bit | System clock |
| `rst` | 1 bit | Active-high reset |
| `in` | 2 bits | Coin input: `01` = ₹5, `10` = ₹10 |

### 🔹 Outputs  
| Signal | Width | Description |
|--------|--------|-------------|
| `out` | 1 bit | Product output (1 = product dispensed) |
| `change` | 2 bits | Change returned: `01` = ₹5, `10` = ₹10 |

---

## 🧠 State Description  

| State | Code | Meaning |
|--------|------|----------|
| `s0` | 00 | ₹0 inserted |
| `s1` | 01 | ₹5 inserted |
| `s2` | 10 | ₹10 inserted |

---

## 🔄 FSM Working Logic  

1. **State s0 (₹0)**  
   - ₹5 inserted → move to `s1`  
   - ₹10 inserted → move to `s2`  

2. **State s1 (₹5)**  
   - ₹5 inserted → move to `s2` (total ₹10)  
   - ₹10 inserted → total ₹15 → dispense item (`out=1`), no change  

3. **State s2 (₹10)**  
   - ₹5 inserted → total ₹15 → dispense item (`out=1`), no change  
   - ₹10 inserted → total ₹20 → dispense item (`out=1`) and return ₹5 as change (`change=01`)  
   - No input → return ₹10 as change (`change=10`)  

---

## 🧪 Testbench Details  

The **testbench** (`vending_machine_tb.v`) provides clock and stimulus inputs to verify FSM transitions and output behavior.  
Simulation can be run in **Vivado**, **ModelSim**, or any Verilog-compatible simulator.

**Testbench Highlights:**
- Clock toggles every 5 ns  
- Reset pulse applied at simulation start  
- Sequences of ₹5 and ₹10 inputs applied to test all state transitions  

---

## 🧰 Tools Used  
- **Vivado 2025.1**  
- **Verilog HDL**

---


