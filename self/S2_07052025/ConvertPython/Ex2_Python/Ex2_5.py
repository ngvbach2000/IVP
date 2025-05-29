import cv2
import matplotlib.pyplot as plt

img1 = cv2.imread('prarie.jpg')
img2 = cv2.imread('giraffe.jpg')
img2_resized = cv2.resize(img2, (img1.shape[1], img1.shape[0]))
combined_img = cv2.add(img1, img2_resized)
plt.figure(figsize=(12, 4))
plt.subplot(1, 3, 1), plt.imshow(cv2.cvtColor(img1, cv2.COLOR_BGR2RGB)), plt.title('prarie Image', fontsize=15), plt.axis('off')
plt.subplot(1, 3, 2), plt.imshow(cv2.cvtColor(img2, cv2.COLOR_BGR2RGB)), plt.title('giraffe Image', fontsize=15), plt.axis('off')
plt.subplot(1, 3, 3), plt.imshow(cv2.cvtColor(combined_img, cv2.COLOR_BGR2RGB)), plt.title('prarie giraffe Image', fontsize=15), plt.axis('off')
plt.show()
plt.savefig('prarie_giraffe.jpg')