% Edge detection: prewitt Operator
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = double(imread('man_face.png'));
%img = double(imread('bike.png'));

h = fspecial('prewitt');

% apply Prewwit operator in horizontal direction
filtered_img1 = imfilter(img, h, 'replicate');
filtered_img1 = abs(filtered_img1); %get its magnitude
filtered_img1 = filtered_img1 / max(filtered_img1(:)); % normalize it

% apply Prewwit operator in vertical direction
filtered_img2 = imfilter(img, h', 'replicate');
filtered_img2 = abs(filtered_img2); %get its magnitude
filtered_img2 = filtered_img2 / max(filtered_img2(:)); % normalize it

% apply Prewwit operator in both direction
filtered_img3 = filtered_img1 .^2 + filtered_img2 .^2;
log_filtered_img3 = log(filtered_img3 + 1);
log_filtered_img3 = log_filtered_img3 / max(log_filtered_img3(:));

bw_edge1 = log_filtered_img3 > 0.01;
bw_edge2 = log_filtered_img3 > 0.02;
bw_edge3 = log_filtered_img3 > 0.04;

%show image
FS = 15;
figure(1), clf;

subplot(2,3,1), imshow(uint8(img)), title('Origin image', "fontsize", FS);
subplot(2,3,2), imshow(filtered_img1), title('Prewwit Horizontal', "fontsize", FS);
subplot(2,3,3), imshow(filtered_img2), title('Prewwit Vertical', "fontsize", FS);
subplot(2,3,4), imshow(bw_edge1), title('Mag > 0.01', "fontsize", FS);
subplot(2,3,5), imshow(bw_edge2), title('Mag > 0.02', "fontsize", FS);
subplot(2,3,6), imshow(bw_edge3), title('Mag > 0.04', "fontsize", FS);
saveas(1, 'Prewwit Operator.jpg');
