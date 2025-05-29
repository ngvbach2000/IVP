% Adding 2 image
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image; %load image package in Octave

%Load test image
Ia = imread('prarie.jpg');
Ib = imread('giraffe.jpg');

% Resize I
Ib1 = imresize(Ib, [size(Ia,1), size(Ia,2)]);

Ic = imadd(Ia, Ib1);

%plot image
FS = 15
figure, clf;

subplot(1, 3, 1), imshow(Ia), title('prarie Image', "fontsize", FS);
subplot(1, 3, 2), imshow(Ib), title('giraffe Image', "fontsize", FS);
subplot(1, 3, 3), imshow(Ic), title('prarie giraffe Image', "fontsize", FS);

saveas(gcf, 'prarie_giraffe.jpg');
