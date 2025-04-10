
% freq_response_dynamic.m
% Lets you enter symbolic expressions for x(t) and H(ω)

clc;
clear;
syms t w real
assume(t, 'real'); assume(w, 'real');

disp('Enter your input signal x(t): (use t as the variable, and heaviside(t) for u(t))');
x_expr = input('x(t) = ', 's');  % Get user input as string
x_t = str2sym(x_expr);

disp('Enter the system frequency response H(ω): (use w as the variable)');
H_expr = input('H(ω) = ', 's');  % Get user input as string
H_w = str2sym(H_expr);

% STEP 1: Fourier Transform of x(t)
X_w = simplify(fourier(x_t, t, w), 'Steps', 100);
disp('X(ω) = Fourier Transform of x(t):');
pretty(X_w);

% STEP 2: Compute Y(ω) = H(ω) * X(ω)
Y_w = simplify(H_w * X_w, 'Steps', 100);
disp('Y(ω) = H(ω) * X(ω):');
pretty(Y_w);

% STEP 3: Inverse Fourier Transform of Y(ω)
y_t = simplify(ifourier(Y_w, w, t), 'Steps', 100);

% STEP 4: Clean symbolic output
y_t_clean = simplify(rewrite(y_t, 'heaviside'), 'Steps', 100);

% Final output
disp('✅ Final y(t):');
pretty(y_t_clean);
