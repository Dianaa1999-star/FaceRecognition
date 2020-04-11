function [m, A, eigenfaces, pr_img] = eigenface_core(database_path)
%TODO
m = [];
A = [];
V = [];
T = [];
X=[];
for i = 1:10
    image_path = strcat(database_path, '/', int2str(i), '.jpg');
    v = double(rgb2gray(imread(image_path)));
    T = [T v(:)];
    [x y] = size(v);
end
for i = 1: x * y
  m=[m sum(T(i,:))/size(T,2)];
endfor
A = T-m';
X = A' * A;
[R D] = eig(X);
for i = 1:length(X)
    if D(i, i) > 1
        V = [V R(:,i)];
    end
endfor
 eigenfaces = A * V;
 pr_img = eigenfaces' * A;
end