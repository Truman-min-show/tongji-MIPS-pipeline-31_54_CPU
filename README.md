# tongji-MIPS-pipeline-31_54_CPU
同济大学 2024年计算机系统结构  大作业 31指令和54指令 5级流水线 CPU
## 以下为使用ai总结

# 计算机系统结构课程实验 - 流水线CPU设计与分析

**参考 [TongjiCS-Undergraduate-Courses](https://github.com/ZhengBryan/TongjiCS-Undergraduate-Courses.git) 改编而来**

---

## 📋 项目概述

本项目包含两个基于 **MIPS指令集** 的流水线CPU设计实验，分别实现 **静态流水线** 与 **动态流水线**，并通过性能指标分析优化效果。实验基于 **Vivado** 开发工具和 **Xilinx NEXYS4 DDR** 开发板完成，涵盖流水线架构设计、数据冲突解决、性能验证模型构建等内容。

---

## 🧩 实验内容

### 实验一：静态流水线CPU设计与性能分析
- **核心功能**：  
  实现五段静态流水线（IF/ID/EX/MEM/WB），支持31条MIPS指令，包括算术运算、分支跳转和访存指令。
- **关键技术**：  
  - 数据冲突处理：通过**暂停机制（Stall）** 解决RAW数据相关。  
  - 性能验证模型：基于“比萨塔摔鸡蛋”问题设计算法，验证流水线吞吐率与加速比。  
  - 下板测试：通过数码管动态显示运算结果，验证逻辑正确性。

### 实验二：动态流水线CPU设计与性能定量分析
- **核心功能**：  
  扩展至支持54条MIPS指令，添加中断处理机制，动态调整流水线行为。  
- **关键技术**：  
  - **动态数据前推（Forwarding）**：优化EX阶段结果直接传递至后续阶段，减少Stall次数。  
  - **中断处理**：通过按键触发暂停/恢复流水线运行，实时显示寄存器状态。  
  - **分段函数验证**：设计复杂数学模型（数组迭代与分段计算），验证动态流水线性能提升。

---

## 🛠️ 技术栈
- **硬件平台**：Xilinx NEXYS4 DDR  
- **开发工具**：Vivado 2016.2  
- **仿真工具**：Mars4（MIPS汇编器）、ModelSim  
- **编程语言**：Verilog HDL（硬件设计）、C语言（算法验证）、MIPS汇编  
- **关键模块**：  
  - **流水线寄存器**：`pipe_if_id`, `pipe_ex_mem`  
  - **冲突处理**：`stall`（静态实验）, `forwarding_unit`（动态实验）  
  - **中断控制器**：`interrupt_handler`  

---



## 📊 性能分析
| **指标**         | 实验一         | 实验二         | 优化效果        |
|-----------------|----------------|----------------|----------------|
| **吞吐率（TP）** | 0.629          | 0.923          | ↑ **46.7%**    |
| **加速比（S）**  | 2.208          | 3.502          | ↑ **58.6%**    |
| **流水线效率**   | 44.2%          | 68.9%          | ↑ **24.7%**    |

---

## 📚 参考文献
1. **计算机体系结构基础**（胡伟武 著）  
2. **MIPS指令集手册**（MIPS Technologies, Inc.）  
3. [TongjiCS-Undergraduate-Courses](https://github.com/ZhengBryan/TongjiCS-Undergraduate-Courses.git) - 参考项目结构与实验设计思路  
4. **Vivado设计套件用户指南**（Xilinx官方文档）  

---

## 🌟 致谢
特别感谢 **郑学长** 的开源项目[TongjiCS-Undergraduate-Courses](https://github.com/ZhengBryan/TongjiCS-Undergraduate-Courses.git) 
```
