import numpy as np
import cv2
from ultralytics import YOLO
import matplotlib.pyplot as plt

def compute_iou(box1, box2):
    x1_max = max(box1[0], box2[0])
    y1_max = max(box1[1], box2[1])
    x2_min = min(box1[2], box2[2])
    y2_min = min(box1[3], box2[3])
    
    inter_area = max(0, x2_min - x1_max) * max(0, y2_min - y1_max)
    box1_area = (box1[2] - box1[0]) * (box1[3] - box1[1])
    box2_area = (box2[2] - box2[0]) * (box2[3] - box2[1])
    
    union_area = box1_area + box2_area - inter_area
    iou = inter_area / union_area
    
    return iou

def gaussian_soft_nms(boxes, scores, sigma=0.1, Nt=0.0001, threshold=0.5):
    N = len(boxes)
    indexes = np.array([i for i in range(N)])
    
    for i in range(N):
        max_score_index = i
        max_score = scores[i]
        
        pos = i + 1
        
        while pos < N:
            if max_score < scores[pos]:
                max_score = scores[pos]
                max_score_index = pos
            pos += 1
        
        boxes[i], boxes[max_score_index] = boxes[max_score_index], boxes[i]
        scores[i], scores[max_score_index] = scores[max_score_index], scores[i]
        indexes[i], indexes[max_score_index] = indexes[max_score_index], indexes[i]
        
        pos = i + 1
        
        while pos < N:
            iou = compute_iou(boxes[i], boxes[pos])
            weight = np.exp(-(iou ** 2) / sigma)
            
            if iou > Nt:
                scores[pos] *= weight
            
            if scores[pos] < threshold:
                boxes[pos], boxes[N - 1] = boxes[N - 1], boxes[pos]
                scores[pos], scores[N - 1] = scores[N - 1], scores[pos]
                indexes[pos], indexes[N - 1] = indexes[N - 1], indexes[pos]
                N -= 1
            else:
                pos += 1
    
    return indexes[:N]

# 이미지 경로
image_path_1 = "/Users/dongheon/Downloads/school_project.v7i.yolov8/test/images/KakaoTalk_Photo_2024-02-20-17-13-08-012_jpeg.rf.8b3a9f54b6f8899bb7b06ad959117ee5.jpg"
image_path_2 = "/Users/dongheon/Downloads/school_project.v7i.yolov8/valid/images/KakaoTalk_Photo_2024-02-20-17-22-03_jpeg.rf.459fa8ead6abf0cf47b68d1a855ee94a.jpg"

# 이미지 로드
image = cv2.imread(image_path_1)

# 모델 로드
model = YOLO('/Users/dongheon/ultralytics/ocr_model/best (1).pt')

# 객체 탐지 수행
results = model(image)[0]

# 바운딩 박스, 신뢰도, 클래스 ID 추출
boxes = results.boxes.xyxy.numpy()  # 바운딩 박스 좌표
scores = results.boxes.conf.numpy()  # 신뢰도
class_ids = results.boxes.cls.numpy().astype(int)  # 클래스 ID

# 원본 이미지 복사 (NMS 적용 전)
image_before_nms = image.copy()

# NMS 적용 전 시각화
for box, score, class_id in zip(boxes, scores, class_ids):
    x1, y1, x2, y2 = map(int, box)
    label = f'{class_id}: {score:.2f}'
    cv2.rectangle(image_before_nms, (x1, y1), (x2, y2), (0, 0, 255), 2)  # 빨강색으로 변경
    cv2.putText(image_before_nms, label, (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 2)  # 빨강색으로 변경

# Gaussian Soft-NMS 적용
keep = gaussian_soft_nms(boxes, scores)

# NMS 적용 후 이미지 복사
image_after_nms = image.copy()

# NMS 적용 후 시각화
for i in keep:
    x1, y1, x2, y2 = map(int, boxes[i])
    confidence = scores[i]
    class_id = class_ids[i]
    label = f'{class_id}: {confidence:.2f}'
    cv2.rectangle(image_after_nms, (x1, y1), (x2, y2), (0, 0, 255), 2)  # 빨강색으로 변경
    cv2.putText(image_after_nms, label, (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 2)  # 빨강색으로 변경

# 이미지 시각화
fig, axs = plt.subplots(1, 2, figsize=(20, 10))

# NMS 적용 전 이미지
axs[0].imshow(cv2.cvtColor(image_before_nms, cv2.COLOR_BGR2RGB))
axs[0].set_title('Before Gaussian Soft-NMS')
axs[0].axis('off')

# NMS 적용 후 이미지
axs[1].imshow(cv2.cvtColor(image_after_nms, cv2.COLOR_BGR2RGB))
axs[1].set_title('After Gaussian Soft-NMS')
axs[1].axis('off')

plt.show()
