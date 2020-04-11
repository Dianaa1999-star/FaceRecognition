function A_k = task1(image, k)
%TODO
image_matrix = double(imread(image));
[m n] = size(image_matrix);
[U, S, V] = svd(image_matrix);
C = S;
C(k + 1:end, :) = 0;
C(:, k + 1:end) = 0;
A_k = U * C * V';
end
