import cv2
import numpy as np
import matplotlib.pyplot as plt

live = cv2.imread('live.jpg') / 255.0
mask = cv2.imread('mask.jpg') / 255.0
dif_img = np.sqrt(np.abs(live - mask))
plt.figure(figsize=(12, 4))
plt.subplot(1, 3, 1), plt.imshow(live), plt.title('Live Image', fontsize=15), plt.axis('off')
plt.subplot(1, 3, 2), plt.imshow(mask), plt.title('Mask Image', fontsize=15), plt.axis('off')
plt.subplot(1, 3, 3), plt.imshow(dif_img), plt.title('Different Image', fontsize=15), plt.axis('off')
plt.show()
plt.savefig('live_mask.jpg')