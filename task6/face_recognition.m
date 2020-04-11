function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
%TODO
T=[];
v = double(rgb2gray(imread(image_path)));
T = v(:);
T= T - m';
PrTestImg = eigenfaces' * T;
[x y] = size(pr_img);
min_dist = norm(pr_img(:,1) -PrTestImg);
output_img_index = 1;
for i = 2:y
    val = norm(pr_img(:,i) - PrTestImg);
    if val < min_dist
      min_dist = val;
      output_img_index = i;
    endif
endfor
end