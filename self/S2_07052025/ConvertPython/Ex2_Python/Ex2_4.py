import cv2
import matplotlib.pyplot as plt
import numpy as np

img = cv2.imread('waterfall.jpg') / 255.0
gamma = 1.9
enhanced_img = np.power(img, gamma)
plt.figure(figsize=(8, 4))
plt.subplot(1, 2, 1), plt.imshow(cv2.cvtColor((img * 255).astype('uint8'), cv2.COLOR_BGR2RGB)), plt.title('Original Image', fontsize=15), plt.axis('off')
plt.subplot(1, 2, 2), plt.imshow(cv2.cvtColor((enhanced_img * 255).astype('uint8'), cv2.COLOR_BGR2RGB)), plt.title('Contrast Image', fontsize=15), plt.axis('off')
plt.show()
plt.savefig('waterfall_contrast.jpg')