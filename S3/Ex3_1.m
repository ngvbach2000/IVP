%Ex3_1 Dividing two images
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test images
notext = imread('gradient.jpg'); %load unsigned integer 8-bit (0-255)
withtext = imread('gradient_with_text.jpg'); %load unsigned integer 8-bit (0-255)

D = imdivide(double(withtext), double(notext));
D = D > 1;

%plot images
FS = 15; %fontsize of caption
figure, clf;
subplot(1,3,1), imshow(notext), title('Without text', "fontsize", FS);
subplot(1,3,2), imshow(withtext), title('With text', "fontsize", FS);
subplot(1,3,3), imshow(D), title('Detected text', "fontsize", FS);

%save image
saveas(gcf, 'Detected Text.jpg');
