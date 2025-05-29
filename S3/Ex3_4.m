%Ex3_4 Gray-Level Transformation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load test image
Img = imread('lion.jpg');
FS = 15; %fontsize of caption

%a. Identity Transformation
%plot the transformation function
%figure(1), clf;
%x = uint8(0 : 255);
%plot(x, 'LineWidth', 1.5); xlim([0 255]); ylim([0 255]);
%grid on;

%perform the identity transformation
%Img1 = x(Img + 1);
%figure(2), clf;
%subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
%subplot(1,2,2), imshow(Img1), title('Identity', "fontsize", FS);
%saveas(2, 'Identity Transformation.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b. Negative Transformation
%plot the transformation function
figure(3), clf;
x = uint8(255 : -1 : 0);
plot(x, 'LineWidth', 1.5); xlim([0 255]); ylim([0 255]);
grid on;

%perform the negative transformation
Img2 = x(Img + 1);
figure(4), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(Img2), title('Negative', "fontsize", FS);
saveas(4, 'Negative Transformation.jpg');
