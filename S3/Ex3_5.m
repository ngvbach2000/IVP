%Ex3_5 Gray-Level Transformation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load test image
Img = imread('lion.jpg');
FS = 15; %fontsize of caption

%a. Logarithmic Transformation
%plot the transformation function
%figure(1), clf;
%x = uint8(0 : 255);
%c = 255 / log(256); % => brighter image
%c = 100 / log(256); % => darker image
%y = c * log(x + 1);
%plot(y, 'LineWidth', 1.5); xlim([0 255]); ylim([0 255]);
%grid on;

%perform the logarithmic transformation
%Img3 = uint8(y(Img + 1));
%figure(2), clf;
%subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
%subplot(1,2,2), imshow(Img3), title('Logarithmic', "fontsize", FS);
%saveas(2, 'Logarithmic Transformation.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b. Piece-wise Linear Transformation
%plot the transformation function
figure(1), clf;
LUT(1 : 101) = 2 * (0 : 100) + 10;
LUT(102 : 201) = 175;
LUT(202 : 256) = 0.85 * (201 : 255) -  12;
plot(LUT, 'LineWidth', 1.5); xlim([0 255]); ylim([0 255]);
grid on;

%perform piece-wise linear transformation
pkg load image;
Img4 = intlut(Img, uint8(LUT));
figure(2), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(Img4), title('Piece-Wise Linear', "fontsize", FS);
saveas(2, 'Piece-Wise Linear Transformation.jpg');

