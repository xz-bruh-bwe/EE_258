% parseval_clean.m
% Computes total energy of f(t) using Fourier Transform and Parseval's Theorem
% and outputs a fully simplified symbolic result

clc;
clear;
syms t w real
assume(t, 'real');
assume(w, 'real');

% --- Step 1: Define f(t)
f_t = 16 / (t^2 + 16);

% --- Step 2: Compute Fourier Transform F(w)
F_w = fourier(f_t, t, w);
F_w = simplify(F_w, 'Steps', 100);
disp('Fourier Transform F(ω):');
pretty(F_w);

% --- Step 3: Compute |F(w)|^2
F_mag_squared = simplify(abs(F_w)^2, 'Steps', 100);

% --- Step 4: Compute energy using Parseval's Theorem
% E = (1/2π) * ∫ |F(w)|^2 dw from -∞ to ∞
energy_raw = int(F_mag_squared, w, -inf, inf);
energy = simplify((1 / (2 * pi)) * energy_raw, 'Steps', 100);

% --- Step 5: Try to force symbolic recognition of common constants
energy = rewrite(energy, 'pi');
energy = simplify(energy, 'Steps', 100);

% --- Step 6: Final answer
disp('------------------------------------');
disp('✅ Total Energy of f(t) using Parseval:');
pretty(energy);
disp('------------------------------------');
