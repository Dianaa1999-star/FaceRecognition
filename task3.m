function [A_k S] = task3(image, k)
image_matrix = double(imread(image));
[m n] = size(image_matrix);
s = 0;
miu = [];
for i = 1:m
    for j = 1:n
        s += image_matrix(i, j);
    endfor
    miu(i) = s / n;
    s = 0;
endfor
for i = 1:m
    for j = 1:n
        image_matrix(i, j) = image_matrix(i, j) - miu(i);
    endfor
endfor
Z = (image_matrix')/(sqrt(n-1));
[U S V] = svd(Z);
W = V(:, 1 : k);
Y = W' * image_matrix;
A_k = (W * Y)(1 : m, :) + miu(:);
S;
%TODO
endfunction
