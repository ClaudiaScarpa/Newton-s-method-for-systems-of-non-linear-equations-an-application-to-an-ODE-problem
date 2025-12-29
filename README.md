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

## 🛠️ Usage (MatLab)
To solve a non-linear ODE problem, define your boundary conditions and grid size, then call the main solver:

```matlab
% Example call
[y, niter, err] = metodonewton(n, yi, yf, xi, xf, F, P, nmax, toll);
