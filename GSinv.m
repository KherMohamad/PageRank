function A_inv = GSinv(A)
  n = size(A, 1);
  sol = zeros(n);
  A_inv = zeros(0);
 [Q R] = QRdecomposition(A);
  Q_T = Q';
  for i = 1: n
    x_i = zeros(n, 1);
    x_i(n) = Q_T(n, i)/ R(n, n);
    for j = n - 1: -1: 1
      x_i(j) = Q_T(j, i);
      for k =  j + 1: n
        x_i(j) -= R(j, k) * x_i(k);
      endfor
      x_i(j) = x_i(j)/ R(j, j);
    endfor
    A_inv = [A_inv x_i];
  endfor
endfunction
