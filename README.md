![image](https://github.com/user-attachments/assets/27fa6dee-6e5f-42b2-8389-18f8a498ceb6)# 한밭대학교 컴퓨터공학과 TripleWave팀

**팀 구성**
- 20191783 이동헌 
- 20201727 김수미
- 20217137 송찬호

## <u>Teamate</u> Project Background
- ### 필요성
  - 학교 내 안전과 효율적인 물품 전달
    - 시간이 여유롭지 못한 상황이나, 급하게 업무를 처리를 해야할 시간에 물품을 대신 전달 해줄 수 있는 상황에 매우 적합  
  - 새로운 도입 및 활용
    - 새롭고 발전된 분위기와 야외가 아닌 실내에 기술을 도입 함으로써 여러가지 방안으로 활용가능
  - 장기 비용 절감 실현
    - 장기적으로 인거비 절감과 다양한 효율성 증대를 통해 비용 절감 효과를 누릴수 있고 더 많은 서비스 제공과 생산성이 증가될 수 있음
- ### 기존 해결책의 문제점
  - 반복적이고 단순한 작업을 수행하는데 필요한 인력 비용이 지속적으로 증가되고 있음
  - 기존 실외 자율 주행 로봇같은 경우 날씨나 외부 요인의 영향을 받을 수 있음
  
## System Design
  - ### System Requirements
    - SBC : Jetson Orin Nano Development Kit
    - Controller : OpenCR 1.0(MCU:32-bit ARM Cortex®-M7 with FPU (216MHz, 462DMIPS))
    - Camera : Intel Realsense D435 or Camera : Intel Realsense D455
    - Actuator : Robotis Dynamixel XM430-W350-T, XM540-W270-R

    -           
    - EEPROM Area : Address(1 Byte) - 7(ID : 1, 2), 12(Secondary ID : 1, 2) Baud Rate(1 Byte) - 3,
    - OS : Ubuntu 20.04(Jetpack SDK 5.1.1)
    - Program Language : Python(>= 3.8.0)
    - Dependency Package : Opencv 4.10.0(Cmake installation required), librealsense SDK, ROS Noetic
   
## 로봇 하드웨어 구성
   ![image](https://github.com/user-attachments/assets/18b73962-f9ee-4911-bbff-e7cfdc65dd8b)
   ![image](https://github.com/user-attachments/assets/907fc4cf-6839-46f7-b7f8-67d89534f16a)

    
## Case Study
  - ### Description
    - 표윤석, 조한철, 정려운, 임태훈(2017, 11), “ROS 개발환경 구축”,「ROS 로봇 프로그래밍」, 루비페이퍼
    - Alexey Spizhevoy, Aleksandr Rynnikov(2018, 3), “Multiple View Geometry”, 「Opencv 3 Computer Vision with Python Cookbook」, Packt Publishing
  
## Conclusion
  - ### OOO
  - ### OOO
  
## Project Outcome
- ### 20XX 년 OO학술대회 
