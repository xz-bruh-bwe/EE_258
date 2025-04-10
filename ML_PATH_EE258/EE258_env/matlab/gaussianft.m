% gaussian_ft_script.m
% Computes the Fourier Transform of f(t) = exp(-k * t^2)
% using the known Fourier pair: e^{-π t^2} ↔ e^{-π f^2}

clc;
clear;
syms t f real

% --- USER DEFINED CONSTANT ---
% Define k in the form: f(t) = exp(-k * t^2)
k = pi / 9;
% -----------------------------

% Step 1: Express f(t)
f_t = exp(-k * t^2);

% Step 2: Find equivalent scaling factor 'a'
% Recall: exp(-k t^2) = exp(-π (t / a)^2) ⇒ a = sqrt(pi / k)
a = sqrt(pi / k);

% Step 3: Apply scaling property of Fourier Transform
% FT{exp(-π t^2)} = exp(-π f^2)
% ⇒ FT{exp(-k t^2)} = a * exp(-π (a * f)^2)
F_f = simplify(a * exp(-pi * (a * f)^2), 'Steps', 100);

% Step 4: Display result
disp('Fourier Transform of f(t) = exp(-k t^2):');
fprintf('With k = %s:\n', string(k));
pretty(F_f)
