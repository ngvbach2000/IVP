% Dividing two imgs
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
% load test imgs
notext = imread('gradient.jpg');
withtext = imread('gradient_with_text.jpg');

D = imdivide(double(withtext), double(notext));
D = D > 1;

%plot image
FS = 15
figure, clf;

subplot(1, 3, 1), imshow(notext), title('No text', "fontsize", FS);
subplot(1, 3, 2), imshow(withtext), title('with text', "fontsize", FS);
subplot(1, 3, 3), imshow(D), title('Text', "fontsize", FS);

saveas(gcf, 'imdivide_text.jpg');

