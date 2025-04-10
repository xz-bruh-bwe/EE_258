% Coefficients (descending powers of z)
b = [-7 8];           % Numerator: -7 + 8*z^(-1)
a = [1 -0.75 .125];    % Denominator: 1 - 0.75*z^(-1) + 0.125*z^(-2)

% Partial fraction expansion
[r, p, k] = residuez(b, a);

% Clean and readable output
fprintf('Partial Fraction Expansion:\n');
for i = 1:length(r)
    fprintf('  %.2f / (1 - %.2f z^{-1})\n', r(i), p(i));
end

% Display direct term if exists
if ~isempty(k)
    fprintf('  Direct term: %.2f\n', k);
end





