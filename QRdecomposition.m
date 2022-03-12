function [Q R] = QRdecomposition(A)
  [rows, cols] = size(A);
  Q = zeros(0);
  Q = [Q A(:, 1)/ norm(A(:, 1))];
 for i = 2: size(A, 2)
   u_i = zeros(size(A, 1), 1);
   u_i = A(:, i);
   for k = 1: i - 1
     u_i -= projection(Q(:, k), A(:, i));
   endfor
   u_i = u_i/ norm(u_i);
   Q = [Q u_i];
 endfor  
 R = zeros(cols);
 for j = 1: cols
   for i = 1: j
    R(i, j) = A(:, j)' * Q(:, i);
  endfor
endfor

endfunction
