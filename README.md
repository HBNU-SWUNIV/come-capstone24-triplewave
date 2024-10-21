# **한밭대학교 컴퓨터공학과**  
## **TripleWave팀**

---

### 팀 구성
- **20191783 이동헌**  
- **20201727 김수미**  
- **20217137 송찬호**  

---

## 📚 **프로젝트 배경**

### 💡 필요성
- **학교 내 안전과 효율적인 물품 전달**  
  - 시간이 여유롭지 못한 상황이나, 급하게 업무를 처리해야 할 때 물품을 대신 전달하는 서비스로 활용할 수 있습니다.
- **새로운 도입 및 활용**  
  - 실내 환경에 자율주행 기술을 도입하여 다양한 활용 방안을 모색할 수 있습니다.
- **장기 비용 절감 실현**  
  - 인건비 절감 및 서비스 효율성 증대를 통해 장기적인 비용 절감과 생산성 향상이 가능합니다.

### ⚠️ 기존 해결책의 문제점
- **반복적이고 단순한 작업 수행 시 인력 비용 증가**  
- **실외 자율 주행 로봇의 날씨나 외부 요인에 따른 불안정성**  

---

## 🛠 **시스템 설계**

### 📋 시스템 요구사항
- **SBC**: Jetson Orin Nano Development Kit  
- **Controller**: OpenCR 1.0 (MCU: 32-bit ARM Cortex®-M7 with FPU (216MHz, 462DMIPS))  
- **Camera**: Intel Realsense D435 또는 Intel Realsense D455  
- **Actuator**: Robotis Dynamixel XM430-W350-T, XM540-W270-R  
- **OS**: Ubuntu 20.04 (Jetpack SDK 5.1.1)  
- **프로그래밍 언어**: Python (>= 3.8.0)  
- **필수 패키지**: 
  - OpenCV 4.10.0
  - librealsense SDK
  - ROS Noetic

---

## 🚀 **로봇 하드웨어 구성**

![Robot Hardware](https://github.com/user-attachments/assets/18b73962-f9ee-4911-bbff-e7cfdc65dd8b)
![Robot Diagram](https://github.com/user-attachments/assets/907fc4cf-6839-46f7-b7f8-67d89534f16a)

---

## 🧩 **코드 구성**

이 프로젝트는 다음과 같은 코드들로 구성되어 있습니다:
- **AMCL**: Adaptive Monte Carlo Localization을 사용하여 로봇의 위치를 추정합니다.
- **마커 인식**: ArUco 마커를 인식하여 로봇의 이동 방향을 조정합니다.
- **이동 제어**: DWA(Dynamic Window Approach)를 사용한 네비게이션 및 경로 계획 코드가 포함되어 있습니다.
- **네비게이션**: Move_base를 활용하여 로봇의 목표 지점 도달을 제어합니다.
- **각종 필터**: LiDAR 데이터 필터링 및 잡음 제거를 위한 설정 파일들이 포함되어 있습니다.

---

## 📂 **관련 패키지 안내**

- 이 프로젝트는 **TurtleBot3** 패키지를 사용합니다. 용량 문제로 해당 패키지를 직접 포함하지 않고, 아래 링크를 통해 설치 및 참조할 수 있습니다:
  - [TurtleBot3 패키지 링크](https://github.com/ROBOTIS-GIT/turtlebot3)

---

## 📖 **참고 문헌 및 연구 사례**

- **표윤석, 조한철, 정려운, 임태훈** (2017), “ROS 개발환경 구축”, 「ROS 로봇 프로그래밍」, 루비페이퍼  
- **Alexey Spizhevoy, Aleksandr Rynnikov** (2018), “Multiple View Geometry”, 「Opencv 3 Computer Vision with Python Cookbook」, Packt Publishing  

---

## 🏆 **프로젝트 성과**

- **20XX 년 OO학술대회**에 발표된 연구 결과입니다.
