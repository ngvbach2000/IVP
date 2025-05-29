% template matching
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
church = double(imread('church.png'));
window = double(imread('window.png'));

%plot image
FS = 15;
figure, clf;
subplot(1, 2, 1), imshow(uint8(church)), title('Origin church', "fontsize", FS);
subplot(1, 2, 2), imshow(uint8(window)), title('Origin window', "fontsize", FS);

%subtract means
church = church - mean(church(:));
window = window - mean(window(:));

figure(2), clf;
subplot(1, 2, 1), imshow(uint8(church)), title('church - meanc', "fontsize", FS);
subplot(1, 2, 2), imshow(uint8(window)), title('window - meanw', "fontsize", FS);

%perform template
flipped_window = fliplr(flipud(window));
r = conv2(church, flipped_window, 'same');

figure(3), clf;
imagesc(r), colorbar('north');
axis on, axis equal;
