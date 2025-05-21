% Piece-wise Linear Tranformation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
img = imread('lion.jpg');

% Piece-wise Linear
LUT(1 : 101) = 2 * (0 : 100) + 10;
LUT(102 : 201) = 175;
LUT(202 : 256) = 0.85 * (201 : 255) - 12;
plot(LUT, 'LineWidth', 1.5);
xlim([0 255]);
ylim([0 255]);
grid on;

%perform the Piece-wise Linear Tranformation
img2 = intlut(img, uint8(LUT));

%plot image
FS = 15
figure, clf;

subplot(1, 2, 1), imshow(img), title('Origin Img', "fontsize", FS);
subplot(1, 2, 2), imshow(img2), title('Img Piece-wise Linear', "fontsize", FS);

saveas(gcf, 'Piece-wise Linear Tranformation.jpg');
