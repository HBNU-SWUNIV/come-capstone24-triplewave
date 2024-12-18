# 🏫 **한밭대학교 컴퓨터공학과 TripleWave팀 - Autonomous Delivery Robot System**

---

## **팀 구성**
- 👨‍💻 **20191783 이동헌**
- 👩‍💻 **20201727 김수미**
- 👨‍💻 **20217137 송찬호**

---

## **📜 프로젝트 배경**
### 필요성
- **학교 내 안전과 효율적인 물품 전달**  
  - 시간적 여유가 부족하거나 긴급한 상황에서 물품을 대신 전달할 수 있는 시스템 구축이 필요합니다.
- **새로운 도입 및 활용**  
  - 실내 공간에 첨단 기술을 도입하여 다양한 방식으로 활용이 가능하며, 최신 기술을 체험할 수 있는 기회를 제공합니다.
- **장기 비용 절감**  
  - 인건비 절감과 더불어 서비스 효율성을 증대하여 장기적인 비용 절감 효과를 기대할 수 있습니다.

### 기존 해결책의 문제점
- 반복적이고 단순한 작업에 대한 인력 비용이 지속적으로 증가하고 있습니다.
- 실외 자율주행 로봇은 날씨나 외부 환경의 영향을 크게 받습니다.

---

## **🛠 System Design**
### 시스템 요구 사항
- **SBC** : Jetson Orin Nano Development Kit
- **Controller** : OpenCR 1.0 (MCU: 32-bit ARM Cortex®-M7 with FPU (216MHz, 462DMIPS))
- **Camera** : Intel Realsense D435 or D455
- **Actuator** : Robotis Dynamixel XM430-W350-T, XM540-W270-R
- **OS** : Ubuntu 20.04 (Jetpack SDK 5.1.1)
- **Programming Language** : Python (>= 3.8.0)
- **Dependency Packages** : 
  - Opencv 4.10.0 (Cmake 설치 필요)
  - librealsense SDK
  - ROS Noetic

---

## **🤖 로봇 하드웨어 구성**
- 다양한 하드웨어 모듈과 센서들이 조합되어 로봇의 제어와 자율주행을 수행합니다.  

![로봇 구조](https://github.com/user-attachments/assets/18b73962-f9ee-4911-bbff-e7cfdc65dd8b)
![로봇 이미지](https://github.com/user-attachments/assets/907fc4cf-6839-46f7-b7f8-67d89534f16a)

---

## **🤖 ROS와 서버와의 통신 구조**
- rosbridge를 이용한 ROS와 외부 서버 통신. 
![image](https://github.com/user-attachments/assets/d008b8b6-961e-41d5-95c7-05bbc05173c9)


## **📚 전체적인 시나리오**
![image](https://github.com/user-attachments/assets/1bf57c20-2e0c-4cde-a540-c02f6cd528df)


## **🧩 코드 구성**
1. **임베디드 시스템 - 로봇 제어**  
   - Jetson Orin Nano와 OpenCR을 활용하여 로봇의 이동 및 제어를 수행합니다.
   - Dynamixel 모터와 LiDAR 센서를 통합하여 자율주행 및 물체 인식을 가능하게 합니다.
  
2. **인공지능 모델 - YOLOv8과 Grounding DINO 1.6**  
   - **YOLOv8** : 객체 탐지와 경로 예측을 위한 딥러닝 모델을 사용합니다.
   - **Grounding DINO 1.6** : 제로 샷 학습 모델을 활용하여 엘리베이터 문 상태 인식을 수행합니다.

3. **백엔드 - 자바 스프링**  
   - 로봇과의 통신을 담당하며, 어플리케이션과 연동하여 명령을 주고받는 구조로 설계되었습니다.
   - Java Spring Framework를 이용해 안정적이고 확장 가능한 시스템을 구축했습니다.
   - 캡스톤 백엔드 서버 레포지토리는 [여기](https://github.com/HBNU-SWUNIV/come-capstone24-Triplewave-Server)에서 볼 수 있습니다.

---

## **📚 Case Study**
- 표윤석, 조한철, 정려운, 임태훈 (2017), “ROS 개발환경 구축”, 「ROS 로봇 프로그래밍」, 루비페이퍼
- Alexey Spizhevoy, Aleksandr Rynnikov (2018), “Multiple View Geometry”, 「Opencv 3 Computer Vision with Python Cookbook」, Packt Publishing

---

## **📈 프로젝트 성과**
![image](https://github.com/user-attachments/assets/5ee40cd6-0dc0-47fd-aa3d-bc12b34a0743)


1. **2024 SW중심대학 우수작품 경진대회** 참가
2. **대한전자공학회 2024년도 추계학술대회 Autumn Annual Conference of IEIE, 2024**

---

## **🔚 결론**
- 이번 프로젝트를 통해 학교 내 층간이동 자율주행 로봇의 필요성과 이를 구현하기 위한 여러가지 기술적인 접근을 논의하였으며, 다양한 실험과 개선을 통해 실제 환경에서 효율적으로 작동할 수 있는 로봇 시스템을 설계하였습니다.
