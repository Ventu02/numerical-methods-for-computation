# Numerical Methods for Computing Project

This repository contains the scripts and functions developed for the **Numerical Methods for Computation** course, held in the academic year 2022/2023. The project consists of the implementation of fundamental numerical algorithms using the **Matlab/Octave** computing environment.

## Course Description

**Knowledge and Skills to be Acquired**
By the end of the course, the student knows the basic notions of Scientific Numerical Computing. They learn the essential characteristics of numerical methods for solving classic mathematical problems using a computer, with minimal time and maximum accuracy. For the proposed algorithms, the student is able to use the Matlab/Octave system for experimenting with methods and applications.

**Contents**
Data representation on a computer and floating-point arithmetic. Approximation of experimental data and function approximation via polynomial interpolation. Quadrature formulas for estimating integrals of functions, calculating roots of non-linear functions, and solving linear systems. The theoretical part is accompanied by laboratory activity where the Matlab/Octave system is used to experiment with the proposed methods.

## Exercises Description

The repository is organized into 8 practical exercises covering the following topics:

1.  **Matlab Environment and Basic Scripting**:
    Introduction to matrix algebra in Matlab (row/column manipulation, element-wise operations vs. matrix operations). Creation of scripts for calculating basic statistics (min, max, mean), calculating slope, and elementary physics problems (projectile motion).

2.  **Matlab Language and Data Analysis**:
    Deepening the use of `function` and `script`. The focus is on analyzing real data (temperature file `ATLANTA.txt`), implementing unit conversions, calculating monthly/annual statistics, and data visualization via bar charts.

3.  **Floating Point Arithmetic and Finite Numbers**:
    Study of machine precision (`eps`), rounding unit, and the *gradual underflow* phenomenon (IEEE 754). Analysis of numerical stability, inherent error, and algorithmic error (e.g., compound interest formula and derivative approximation via finite differences).

4.  **Polynomial Functions and Graphics**:
    Advanced use of the `plot` function. Implementation of Horner's algorithm for polynomial evaluation and study of algorithmic vs. inherent error. Introduction to polynomial bases (Canonical, Bernstein) and Taylor approximation.

5.  **Polynomial Interpolation**:
    Implementation of polynomial interpolation using Newton's form and Lagrange's form. Analysis of convergence and the Runge phenomenon by comparing equidistant nodes and Chebyshev nodes. Study of the Lebesgue constant and conditioning.

6.  **Numerical Integration**:
    Implementation of Newton-Cotes quadrature formulas (Trapezoidal and Simpson, simple and composite). Analysis of the error convergence order and implementation of Richardson extrapolation. Development of adaptive integration algorithms.

7.  **Non-linear Equations**:
    Iterative methods for finding roots of non-linear functions: Bisection, Newton, and Secant methods. Analysis of the order of convergence, definition of starting intervals, and comparison with the built-in `fzero` function.

8.  **Linear Systems and LU Factorization**:
    Solving linear systems $Ax=b$ via LU factorization (simple Gauss algorithm and with partial pivoting). Stability analysis of the factorization and study of the condition number of special matrices (Hilbert, Vandermonde).

## Repository Structure

Each folder contains the `.m` scripts, functions, and necessary data files (`.txt`) to carry out the specific exercise.

-   `Exercise1/`: Matrix operations and first scripts.
-   `Exercise2/`: Atlanta temperature analysis and functions.
-   `Exercise3/`: Machine arithmetic and stability.
-   `Exercise4/`: Graphics and polynomials (Horner, Taylor).
-   `Exercise5/`: Interpolation (Lagrange, Newton, Chebyshev).
-   `Exercise6/`: Numerical integration and adaptive methods.
-   `Exercise7/`: Function roots (Newton, Secant, Bisection).
-   `Exercise8/`: LU Factorization and conditioning.

## Requirements

The code has been developed to be executed in a Matlab or GNU Octave environment.

-   **Software**: Matlab R2022b (or later versions) or GNU Octave.
-   **Libraries**: Standard Matlab library. No external toolboxes are required.

### Execution Instructions

1.  Download the repository or clone it locally.
2.  Open Matlab/Octave and navigate to the desired exercise folder.
3.  Run the main scripts (usually named `main_*.m` or `s*.m` as indicated in the instructions) from the Command Window or the Editor.

Example of execution for a script:

```matlab
>> cd Exercise7
>> main_bisez
