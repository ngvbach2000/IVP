import cv2
import matplotlib.pyplot as plt

img = cv2.imread('rose.jpg') / 255.0
scale = 0.5
scaled_img = img * scale
plt.figure(figsize=(8, 4))
plt.subplot(1, 2, 1), plt.imshow(cv2.cvtColor((img * 255).astype('uint8'), cv2.COLOR_BGR2RGB)), plt.title('Original Image', fontsize=15), plt.axis('off')
plt.subplot(1, 2, 2), plt.imshow(cv2.cvtColor((scaled_img * 255).astype('uint8'), cv2.COLOR_BGR2RGB)), plt.title('Brighter Image', fontsize=15), plt.axis('off')
plt.show()
plt.savefig('rose_darker.jpg')