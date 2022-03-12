function R = Iterative(nume, d, eps)
  fid = fopen(nume);
  n= str2num(fgetl(fid));
  adj = zeros(n);
  for i = 1: n  
    line = str2num(fgetl(fid));
    for j = 3: size(line, 2)
      if (line(j) ~= i)
      adj(i, line(j)) = 1;
    endif
    endfor
  endfor
  L = zeros(n, 1);
  for i = 1: n
    for j = 1: n
      if (adj(i, j) == 1 && i ~= j)
        L(i)++;
      endif
    endfor
  endfor
      
  fclose(fid);
  pr_k = zeros(n, 1);
  pr_kplus = zeros(n, 1);
  for i = 1: n
    pr_k(i) = 1/ n;
  endfor
  K = zeros(n);
  for i = 1: n
    K(i, i) = L(i);
  endfor
  Kinv = inv(K);
  prod = Kinv * adj;
  M = prod';
  VofOnes = ones(n, 1);
  pr_kplus = d * M * pr_k + (1 - d)/ n * VofOnes;
 
  while (norm(pr_kplus - pr_k) >= eps)
    pr_iter = zeros(n, 1);
    pr_iter = d * M * pr_kplus + (1 - d)/ n * VofOnes;
    pr_k = pr_kplus;
    pr_kplus = pr_iter;
  endwhile
  R = pr_kplus;  
  endfunction
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 