# TurtleBot3 Control and Navigation Codes

Welcome to the TurtleBot3 Control and Navigation Codes repository! This repository contains various codes and scripts to control and navigate TurtleBot3 robots efficiently using several modules like AMCL, marker recognition, movement control, navigation, and filtering.

## 📂 Repository Structure

This repository is organized into different modules, each focusing on specific functionality for the TurtleBot3 robot:

1. **AMCL (Adaptive Monte Carlo Localization)**: This module is responsible for localizing the robot in a known map using particle filtering techniques.
2. **Marker Recognition**: Utilizes the camera sensor to detect and identify ArUco markers, enabling precise localization and interaction with environments like elevator buttons.
3. **Movement Control**: Provides scripts to control the movement of the robot, including basic teleoperation, path planning, and obstacle avoidance.
4. **Navigation**: Uses ROS Navigation Stack (DWA Planner, Move_base) for autonomous path planning and movement.
5. **Various Filters**: Contains filtering mechanisms such as LiDAR data filtering to improve SLAM accuracy and reduce noise.

## 🔗 TurtleBot3 Package

The full TurtleBot3 package is not included in this repository due to its size. You can access and download the official TurtleBot3 packages using the following link:

- [TurtleBot3 ROS Packages](https://github.com/ROBOTIS-GIT/turtlebot3)

Please follow the instructions provided in the linked repository to set up the necessary packages before using the code in this repository.

## ⚙️ Installation

To set up and use the codes in this repository, follow the steps below:

1. Clone this repository to your catkin workspace:
    ```bash
    git clone <repository-link> ~/catkin_ws/src/
    ```
2. Ensure you have the TurtleBot3 packages installed as mentioned above.
3. Build your catkin workspace:
    ```bash
    cd ~/catkin_ws
    catkin_make
    ```
4. Source your workspace:
    ```bash
    source ~/catkin_ws/devel/setup.bash
    ```

## 🛠 Modules Overview

### 1. AMCL
- **Description**: The AMCL module implements particle filtering to localize the TurtleBot3 within a known map. It is crucial for accurate navigation and path planning.
- **Launch Command**: 
    ```bash
    roslaunch turtlebot3_navigation amcl.launch
    ```

### 2. Marker Recognition
- **Description**: This module uses an Intel D455 camera and the ArUco marker library for detecting and recognizing specific markers. It assists in precise localization and robot manipulation tasks like pressing elevator buttons.
- **Launch Command**: 
    ```bash
    roslaunch turtlebot3_marker_recognition marker_recognition.launch
    ```

### 3. Movement Control
- **Description**: This module provides movement control functionalities, including teleoperation and autonomous movement through a predefined path.
- **Launch Command**: 
    ```bash
    roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
    ```

### 4. Navigation
- **Description**: The navigation module includes configurations for DWA Planner and Move_base for autonomous path planning, avoiding obstacles, and reaching target destinations.
- **Launch Command**: 
    ```bash
    roslaunch turtlebot3_navigation move_base.launch
    ```

### 5. Various Filters
- **Description**: Implements filtering techniques for LiDAR data to enhance SLAM accuracy by reducing noise and unwanted reflections from the environment.
- **Launch Command**: 
    ```bash
    roslaunch turtlebot3_navigation laser_filter.launch
    ```

## 🚀 Getting Started

To run the basic navigation with AMCL:
1. Ensure that your TurtleBot3 is set up and powered on.
2. Launch the AMCL and navigation module:
    ```bash
    roslaunch turtlebot3_navigation turtlebot3_navigation.launch
    ```
3. Use the movement control module or set a goal using RViz.

## 📢 Notes
- Make sure to adjust your environment variables like `TURTLEBOT3_MODEL` before launching.
- For using the marker recognition module, ensure your camera is calibrated and the appropriate ROS package is set up.

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

Enjoy building and experimenting with TurtleBot3!

