%Ex8_1 Edge Detection: Sobel Operator
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = double(imread('bike.png'));
%Img = double(imread('man_face.png'));

h = fspecial('sobel');
%apply Sobel operator in horizontal direction
filtered_Img1 = imfilter(Img, h, 'symmetric');
filtered_Img1 = abs(filtered_Img1); %gets its magnitude
filtered_Img1 = filtered_Img1 / max(filtered_Img1(:)); %normalize it

%apply Sobel operator in vertical direction
filtered_Img2 = imfilter(Img, h', 'symmetric'); %h': transpose of h
filtered_Img2 = abs(filtered_Img2); %gets its magnitude
filtered_Img2 = filtered_Img2 / max(filtered_Img2(:)); %normalize it

%apply Sobel operator in both directions
filtered_Img3 = filtered_Img1 .^2 + filtered_Img2 .^ 2;
log_filtered_Img3 = log(filtered_Img3 + 1); %gets its magnitude in logarithmic
log_filtered_Img3 = log_filtered_Img3 / max(log_filtered_Img3(:)); %normalize it

bw_edge1 = log_filtered_Img3 > 0.01; %threshold = 1%
bw_edge2 = log_filtered_Img3 > 0.02; %threshold = 2%
bw_edge3 = log_filtered_Img3 > 0.04; %threshold = 4%

%plot images
FS = 15; %fontsize of caption
figure, clf;
subplot(2,3,1), imshow(uint8(Img)), title('Original Image', "fontsize", FS);
subplot(2,3,2), imshow(filtered_Img1), title('Sobel Horizontal', "fontsize", FS);
subplot(2,3,3), imshow(filtered_Img2), title('Sobel Vertical', "fontsize", FS);

subplot(2,3,4), imshow(bw_edge1), title('Mag > 0.01', "fontsize", FS);
subplot(2,3,5), imshow(bw_edge2), title('Mag > 0.02', "fontsize", FS);
subplot(2,3,6), imshow(bw_edge3), title('Mag > 0.04', "fontsize", FS);
saveas(gcf, 'Sobel Operator.jpg');
