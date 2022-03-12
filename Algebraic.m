function R = Algebraic(nume, d)
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
  K = zeros(n);
  for i = 1: n
    K(i, i) = L(i);
  endfor
  M = zeros(n);
  M = GSinv(K) * adj;
  M = M';
  sol = eye(n) - d * M;
  R = GSinv(sol)* (1 - d)/ n * ones(n, 1);
  
  
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	