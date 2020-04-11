function task5()
%TODO
image_matrix = double(imread("in/images/image3.gif"));
[m n] = size(image_matrix);
k = [1:19 20:20:99 100:30:min(m, n)];
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
for i = 1:m
    A(i) = (S(i, i));
end
figure(1);
plot(A);
for j = 1:size(k, 2)
    s1 = 0;
    s2 = 0;
    for i = 1 : k(j)
        s1 += S(i, i);
    endfor
    for i = 1 : min(m, n)
        s2 += S(i, i);
    endfor
    Sum(j) = s1 / s2;
endfor
figure(2);
plot(k, Sum);
rez = 0;
[U S V] = svd(image_matrix);
for c = 1:size(k, 2)
    C = S;
    sum3 = 0;
    C(k(c) + 1 : end, :) = 0;
    C(:, k(c) + 1 : end) = 0;
    A_k = U * C * V';
    for i = 1:m
        for j = 1:n
            sum3 += (image_matrix(i, j) - A_k(i, j)) .^ 2;
        end
    end
    rez(c) = sum3 / (m * n);
endfor
figure(3);
plot(k, rez);
comp = zeros(1, size(k, 2));
for i = 1:size(k, 2)
    comp(i) = (2 * k(i) + 1) / n;
endfor
figure(4);
plot(k, comp);
end