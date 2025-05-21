% Gray level tranformation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
img = imread('lion.jpg');

% identity
x = uint8(0 : 255);
plot(x, 'LineWidth', 1.5);
xlim([0 255])
ylim([0 255])
grid on;
img1 = x(img + 1);

%perform the identity transfromation

%plot image
FS = 15
figure, clf;

subplot(1, 2, 1), imshow(img), title('Origin Img', "fontsize", FS);
subplot(1, 2, 2), imshow(img1), title('Img Identity', "fontsize", FS);

saveas(gcf, 'img identity.jpg');

% negative

x = uint8(255 : -1 : 0);
plot(x, 'LineWidth', 1.5);
xlim([0 255])
ylim([0 255])
grid on;

img2 = x(img + 1);

%perform the identity transfromation

%plot image
FS = 15
figure, clf;

subplot(1, 2, 1), imshow(img), title('Origin Img', "fontsize", FS);
subplot(1, 2, 2), imshow(img2), title('Img Identity', "fontsize", FS);

saveas(gcf, 'img negative.jpg');





