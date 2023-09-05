# ME5413_Final_Project
# ME5413_Final_Project
ME5413 Final Project from Group 16
> Authors: Zeng Jinling, Shen Xiaoting, Lei Haoran, Shang Jiajian

## Dependencies

* System Requirements:
  * Ubuntu 20.04 (18.04 not yet tested)
  * ROS Noetic (Melodic not yet tested)
  * C++11 and above
  * CMake: 3.0.2 and above
* This repo depends on the following standard ROS pkgs:
  * `roscpp`
  * `rospy`
  * `rviz`
  * `std_msgs`
  * `nav_msgs`
  * `geometry_msgs`
  * `visualization_msgs`
  * `tf2`
  * `tf2_ros`
  * `tf2_geometry_msgs`
  * `pluginlib`
  * `map_server`
  * `gazebo_ros`
  * `jsk_rviz_plugins`
  * `jackal_gazebo`
  * `jackal_navigation`
  * `velodyne_simulator`
  * `teleop_twist_keyboard`
* And this [gazebo_model](https://github.com/osrf/gazebo_models) repositiory


## Installation
```bash
# Clone your own fork of this repo (assuming home here `~/`)
cd
git clone https://github.com/LiLiLiNaNaNa/ME5413_Final_Project.git
cd ME5413_Final_Project

# Install all dependencies
rosdep install --from-paths src --ignore-src -r -y

# Build
catkin_make
# Source 
source devel/setup.bash
```
## Usage

### 0. Gazebo World

This command will launch the gazebo with the project world

```bash
# Launch Gazebo World together with our robot
roslaunch me5413_world world.launch
```
### 1. Mapping

After launching **Step 0**, in the second terminal:

```bash
# Launch Karto Mapping
roslaunch me5413_world mapping_karto.launch
```

After finishing mapping, run the following command in the thrid terminal to save the map:

```bash
# Save the map as `my_map` in the `maps/` folder
roscd me5413_world/maps/
rosrun map_server map_saver -f my_map map:=/map
```

### 2. Navigation

Once completed **Step 1** mapping and saved your map, quit the mapping process.

Then, in the second terminal:

```bash
# Use TEB local path planer and Hybrid A Star global path planer
roslaunch me5413_world teb_hybridastar_nav.launch
```

or

```bash
# Use original navigation algorithm
roslaunch me5413_world navigation.launch
```

or

```bash
# Use TEB with original Dijkstra
roslaunch me5413_world navigation_teb_loc.launch
```

or

```bash
# Use original DWA with Hybrid A Star
roslaunch me5413_world navigation_hybridastar.launch
```

You can check the introductions to these navigation algorithms and results in our report.

## Evaluation

Run the evaluation program in the Analysis folder.
