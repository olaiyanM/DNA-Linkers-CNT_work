# DNA-Linkers-CNT_work

This repository contains the complete computational workflow for the study of DNA–Linker–CNT hybrid systems, including Molecular Dynamics (MD), Density Functional Theory (DFT), and Charge Transport (CT) analysis. Figures 1–4 from the associated publication are generated from this framework.

---

## Project Workflow
<img width="666" height="596" alt="image" src="https://github.com/user-attachments/assets/7714e0ed-448c-4f39-af9a-a9190a67c745" />


### 1. Structure Preparation for MD
Prepare the initial systems with DNA and linker (Ester or Amino) connected to CNT:
- `1_MD/MD_DNA-Ester Linker-CNT/` → Contains `DEC.rst7`, `DEC.parm7`
- `1_MD/MD_DNA-Amino Linker-CNT/` → Contains `DLC.rst7`, `DLC.parm7`

Both folders include:
- AMBER input files: `mini1.in`, `mini2.in`, `heat.in`, `eq.in`, `md.in`

---

### 2. MD Simulations
Run classical MD simulations using the input files above:
- Simulations generate trajectories for structural and dynamic insights

---

### 3. MD Analysis → **Figure 1**
Post-processing of MD trajectories to analyze DNA fluctuations:
- `1_MD/MD_Analysis/`
  - `RMSD_Calc.tcl`, `RMSF_Calc_all.tcl`, `RMSF_calcSI.ipynb`
- `3_Figures/F1_RMSD/`
  - `RMSD_Plot.ipynb` → Produces Figure 1

---

### 4. DFT Calculations (from MD structures)
Extract structures at 0 ns and 100 ns and perform DFT:
- `2_DFT_and_CT/`
  - Gaussian input files: `DEC_0ns.gjf`, `DEC_100ns.gjf`, etc.
- Optimized geometries used for CT and cube files generation

---

### 5. Charge Transport → **Figures 2 & 4**
Calculate transmission and CT coupling:
- `2_DFT_and_CT/DNATransmission_Decoherence.m` → Transmission calculations
- `3_Figures/F2_CT/` and `F4_CTcoupling/`
  - `.mat` and `.m` files: `Tr_plot.m`, `CT_coupling_plot.m`, etc.
  - Inputs from DFT outputs → Figures 2 and 4

---

### 6. Cube Files for Orbital Plots → **Figure 3**
Visualize HOMO/LUMO orbitals from DFT:
- `3_Figures/F3_HLcubes/`
  - Contains cube files for both linkers at 0 ns and 100 ns
  - Used for plotting orbital isosurfaces shown in Figure 3

---

##  Repository Layout

```
.DNA-Linkers-CNT_work
├── 1_MD
│   ├── MD_DNA-Amino Linker-CNT/    # MD prep for amino linker
│   ├── MD_DNA-Ester Linker-CNT/    # MD prep for ester linker
│   ├── MD_Analysis/                # RMSD/RMSF scripts
├── 2_DFT_and_CT/                     # DFT inputs + Transmission MATLAB script
├── 3_Figures/
│   ├── F1_RMSD/                    # RMSD plot (Fig. 1)
│   ├── F2_CT/                      # Transmission data (Fig. 2)
│   ├── F3_HLcubes/                 # Cube files for orbitals (Fig. 3)
│   └── F4_CTcoupling/              # Coupling plots (Fig. 4)
```

---

## Notes
- File naming:
  - `DEC` = Ester linker system
  - `DLC` = Amino linker system

---

## Contact
For questions or contributions, please reach out via [GitHub Issues](https://github.com/olaiyanM/DNA-Linkers-CNT_work/issues).

