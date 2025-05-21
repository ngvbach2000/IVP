% Gray level tranformation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
img = imread('lion.jpg');

% logarithmic
x = uint8(0 : 255);
c = 255 / log(256); % brighter
c = 155 / log(256); % darker
y = c * log(x + 1);
plot(y, 'LineWidth', 1.5);
xlim([0 255])
ylim([0 255])
grid on;
img1 = uint8(y(img + 1));

%perform the logarithmic transfromation

%plot image
FS = 15
figure, clf;

subplot(1, 2, 1), imshow(img), title('Origin Img', "fontsize", FS);
subplot(1, 2, 2), imshow(img1), title('Img Logarithmic', "fontsize", FS);

saveas(gcf, 'img logarithmic.jpg');
