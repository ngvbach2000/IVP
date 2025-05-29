%Ex9_4 Template Matching
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test images
church = double(imread('church.png'));
window = double(imread('window.png'));

%plot images
FS = 15; %fontsize of caption
figure(1), clf;
subplot(1,2,1), imshow(uint8(church)), title('Orignal Church', "fontsize", FS);
subplot(1,2,2), imshow(uint8(window)), title('Orignal Window', "fontsize", FS);

%subtract means
church = church - mean(church(:));
window = window - mean(window(:));
figure(2), clf;
subplot(1,2,1), imshow(uint8(church)), title('Church - MeanC', "fontsize", FS);
subplot(1,2,2), imshow(uint8(window)), title('Window - MeanW', "fontsize", FS);

%perform template matching
flipped_window = fliplr(flipud(window));
r = conv2(church, flipped_window, 'same');
figure(3), clf;
imagesc(r), colorbar('north');
axis off, axis equal;
