function [R1 R2] = PageRank(nume, d, eps)
  outputPath = strcat(nume, ".out");
  fid = fopen(outputPath, 'w');
  R1 = Iterative(nume, d, eps);
  for i = 1: size(R1, 1)
    fprintf(fid, "%d \n", R1(i));
  endfor
  fprintf(fid, "\n");
  R2 = Algebraic(nume, d);
  for i = 1: size(R2, 1)
    fprintf(fid, "%d \n", R2(i));
  endfor
  fclose(fid);
endfunction

	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 