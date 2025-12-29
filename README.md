# Newton's Method for Systems of Non-linear Equations: an application to an ODE problem

This repository contains the numerical implementation and theoretical analysis developed for my **Bachelor's Thesis in Mathematics** at the University of Trento (A.Y. 2022-2023).

## Project Overview
Implementation of the generalized Newton's method for solving non-linear systems from Boundary Value Problems (BVPs). This project explores the discretization of second-order non-linear Ordinary Differential Equations (ODEs) using central finite differences and provides a robust MatLab implementation featuring the Thomas algorithm for efficient tridiagonal system resolution.

## Key Features
- **Newton-Raphson for Systems**: A multi-dimensional implementation of the iterative method to solve non-linear algebraic systems.
- **BVP Discretization**: Application of central finite differences to transform ODEs into solvable systems.
- **Thomas Algorithm**: Implementation of an optimized solver for tridiagonal matrices to reduce computational complexity.
- **Convergence Analysis**: Verification of the quadratic convergence and error behavior as a function of the grid step $h$.

## Repository Structure
- `src/`: Core MatLab functions.
  - `metodonewton.m`: The main solver implementing the Newton iteration.
  - `differenzecentrate.m`: Function to construct the system $F(y) = 0$ and its Jacobian.
  - `thomasbis.m`: Optimized tridiagonal system solver.
- `docs/`: Thesis documentation (PDF).
- `examples/`: Scripts to replicate the numerical tests and convergence plots.

## Usage (MatLab)
To solve a non-linear ODE problem, define your boundary conditions and grid size, then call the main solver:

```matlab
% Example call
[y, niter, err] = metodonewton(n, yi, yf, xi, xf, F, P, nmax, toll);
```
## Numerical Results
The tests conducted (e.g., Example 4.11) show that the method is highly efficient, typically reaching the desired tolerance in just 4 iterations.

| Grid Points ($n$) | Iterations | $L^{\infty}$ Error |
| :--- | :---: | :--- |
| 16 | 4 | $1.2 \cdot 10^{-3}$ |
| 32 | 4 | $2.95 \cdot 10^{-4}$ |
| 64 | 4 | $7.38 \cdot 10^{-5}$ |
| 128 | 4 | $1.85 \cdot 10^{-5}$ |
| 256 | 4 | $4.61 \cdot 10^{-6}$ |
| 512 | 4 | $1.15 \cdot 10^{-6}$ |

## Author
Claudia Scarpa Bachelor's Degree in Mathematics - University of Trento Supervisor: Prof. Paola Zanolli

## References
Quarteroni, A., Sacco, R., Saleri, F. (2008). Matematica Numerica.

Greenspan, D., Casulli, V. (1988). Numerical Analysis for Applied Mathematics, Science, and Engineering.
