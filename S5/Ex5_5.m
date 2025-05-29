%Ex5_5 Noise Low-Pass Filter (LPF)
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
Img = imread('airplane.png');

%construct three different filters
[wx, wy] = meshgrid(-pi : pi/8 : pi, -pi : pi/8 : pi);

%compute frequency responses
%type = '1d_horizontal';
%type = '1d_vertical';
type = '2d';

if strcmp(type, '2d') == 1
  %filter frequency-domain
  H = (1/256) * (1 + 2*cos(wx) + 2*cos(2*wx)) .* (1 + 2*cos(wy) + 2*cos(2*wy));
  h = (1/256) * ones(16); %spatial-domain
elseif strcmp(type, '1d_horizontal') == 1
  H = (1/16) * (1 + 2*cos(wx) + 2*cos(2*wx));
  h = (1/16) * ones(1,16); %row-vector
elseif strcmp(type, '1d_vertical') == 1
  H = (1/16) * (1 + 2*cos(wy) + 2*cos(2*wy));
  h = (1/16) * ones(16,1); %column-vector
end

%plot three filters
FS = 15; %fontsize of caption
figure(1), clf;
surf(wx/pi, wy/pi, abs(H)); axis([-1 1 -1 1 0 1]);
set(gca, 'XTick', -1 : 0.5 : 1, 'YTick', -1 : 0.5 : 1);
xlabel('\omega_x / \pi'); ylabel('\omega_y / \pi');
zlabel('H|(\omega_x, \omega_y|');
saveas(1, 'Frequency Responses of Three Filters.jpg');

%apply to filter noisy image
Filtered_Img = imfilter(Img, h, 'symmetric');
figure(2), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(Filtered_Img), title('Filtered Image', "fontsize", FS);
saveas(2, 'Original vs. Filtered Images.jpg');
