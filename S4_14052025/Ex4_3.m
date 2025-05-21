% Contrast limited adaptive hítogram equalization
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;
img = imread('moon.jpg');

%plot histogram
[count, bins] = imhist(img)
maxCount = max(count(:));

%loop over different clipping ratio
clipRatio = [1 0.7 0.4 0.1]; % = 1 => no clipping, 0.7 => clipping 70%
limited_img = cell(1, numel(clipRatio));
LUT = uint8(zeros(numel(clipRatio), 256));
for i = 1 : numel(clipRatio)
  % clip histogram
  clip = clipRatio(i) * maxCount;
  clippedCount = (count < clip) .* count + (count >= clip) * clip;

  % construc one-dimensuonal virtual image for histeq to get mapping function
  clipped_img = [];
  for level = 0 : 255
    clipped_img = cat(2, clipped_img, level * ones(1, clippedCount(level + 1)));
  end
  [temp, T] = histeq_modified(uint8(clipped_img));

  % apply mapping function
  LUT(i,:) = uint8(T * 255);
  limited_img(i) = intlut(img, LUT(i,:));
end

% show img
figure(1), clf;

for i = 1 : numel(clipRatio)
  subplot(1, numel(clipRatio) ,i), imshow(limited_img{i});
  title(['clip at ', num2str(clipRatio(i)), ' max'], "fontsize", FS);
end

saveas(1, 'CLAHE.jpg');

figure(2), clf;
set(gcf, 'Position', [100 100 600 300]);
subplot(1, 2, 1), bar(bins, count), axis([0 255 0 max(count(:))+500]);
set(gca, "fontsize", FS); grid on;
subplot(1, 2, 2), plot(LUT(1:4,:)', "LineWidth", 1.5); axis([0 255 0 255]);
set(gca, "fontsize", FS); set(gcf, "Color", "White");


