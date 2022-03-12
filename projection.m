function pr_uv = projection(u, v)
  pr_uv = zeros(size(u, 1), 1);
  vdotu = v' * u;
  udotu = u' * u;
  pr_uv = vdotu/ udotu * u;
endfunction
