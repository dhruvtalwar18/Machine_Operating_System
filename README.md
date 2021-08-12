# Machine Operating System

<h1><b> Introduction </h1> </b>

The idea is to make a software that will be compatible with several industrial machines and controllers(such as PLCs) so that instead of a plathora of different softwares we can simply use one software to control them all. To implement this we need a common platform to integrate and use them. 
If the available industrial hardware could easily exchange data with a Python program, one could find a vast number of solutions for obstacles the hardware faces. The software and IT world is developing cutting edge solutions for Data Analysis, Artificial Intelligence, IoT, UI/UX, Augmented Reality, Computer Vision and many others. Legacy interface of Industrial machines doesn’t allow the integration of such solutions with these machines. The merging of software solutions with hardware devices can change the face of machines and eventually factories.

<h1><b> Approach </h1> </b>

Wr can now discuss the idea of a Machine Operating System (MOS) which utilizes ROS as an OS and builds ROS packages to serve as machines device drives. An operating system acts as an interpreter for all the devices of a system. The operating system should have an established two-way communication with all the devices of the system. Hence, it is a network of device drivers which facilitates exchange of data and controls execution of programs.
A machine operating system should have the capability to send commands to actuators of a machine, get data from sensors and basic cognition for machines. MOS aims at creating the architecture to enable such functionalities.

<b>Communication with hardware</b> - Machine PLCs can act as simple controllers. The link/layer between the machines and ROS core will be a combination of OPCUA nodes/data tags and ROS nodes. ROS will act as drivers for each machine component. The nodes can get value from the machine tags as well as write on them <br><br>
- Sensors require a driver to only read data. Actuator drivers require data to be read as well as written.<br>
- For actuators, PLC will require control blocks to be made which will provide the functionality to control each component completely.<br>
- These driver nodes will float topics on the ROSCORE, topics for getting data (status) as well as writing data (command).<br><br>

<b> Application Layer </b> - The application layer is to use the functionalities provided by the ROS driver nodes. A python/C++ node can be written for the work sequences and other applications. For example, a separate node can exist which constantly monitors data from sensors and predicts a downtime.
Users interact with the application layer, after initial configuration of ROS drivers with machine data tags.

<b>What MOS will consist of -</b>
1. Generic drivers to enable reading and writing to PLC data tags using industrial communication protocols. So MOS is going to be a package of driver nodes. <br>
  a. Available in as many protocols as possible. <br>
  b. Launch files to link the drivers together. <br>
  c. Integration of action library. <br><br>
2. Nodes for cognition, work sequence, processing and other functionalities needed from the machines. Some application nodes that can be explored are: <br>
  a. Basic work sequence <br>
  b. Process control unit <br>
  c. Predictive maintenance <br>
  d. Tele-Operation <br>
  e. IoT <br>
  <br>
  
 <p align="center"><img src="https://github.com/dhruvtalwar18/Machine_Operating_System/blob/main/images/Machine%20Operating%20System%20Architecture.png" title="MOS Architecture"></p> 
 <p align="center"> Fig.1 MOS Architecture </p><br>


  
 <h1><b> Experiment and Interface</h1> </b> 
 

 <p> The idea of a Machine Operating system was tested on the facility at the cyber physical lab at IIT Delhi. Following is the setup used to serve as a proof of concept of MOS, a station with <b> festo pneumatics, PnF sensors, SMC drives, MiSuMi conveyor, Rockwell PLC and Intel NUC </b> as the edge device. The Rockwell PLC communicates with the devices via Ehternet/IP, programmed on Ladder Logic and is OPC UA enabled. The proximity sensors help track the position of our pallet (a frame developed in house to hold the raw part in place during operation). There is a 4 step pallet engaging process and gripper which uses pneumatic actuators. The gripper is mounted on a 2 Degree of Freedom linear slide (X-Z axis). For the testing of version one of the idea a simple work sequence will be tried, sensing of pallet at entry, engaging of pallet at application area, disengage after few seconds and resetting station state.</p>
 
  
Seven driver nodes were made, all using python, six used the OPC UA communication protocol and one used Ethernet/IP. The nodes publish device status on a status topic and take commands from a control topic. There are 3 types of messages, <b>pneumatic.msg, MAMControl.msg, MAMStatus.msg.</b> MAM is the functional block name for motion of drives in Rockwell. A work sequence node is made which uses required message topics to get pallet position and command required devices.


<p><img align ="right" src="https://github.com/dhruvtalwar18/Machine_Operating_System/blob/main/images/MAM%20function%20block.png" title="PLC functional block"><br><br><br><br><br><br><br> <img align ="left" src="https://github.com/dhruvtalwar18/Machine_Operating_System/blob/main/images/ROS%20%20Node%20Graph.png" title="RQT graph" width = "550"></p>
<br><br><br><br><br><br><br><br><br><br><br><br>
<p align="center"> Fig.2 The RQT graph showing ROS nodes and its use in the PLC functional block respectively </p><br>
<br><br>

<p align="center"><img src="https://github.com/dhruvtalwar18/Machine_Operating_System/blob/main/images/DashBoard_created.PNG" title="QT based Dashboard"></p>

<p align="center">Fig. 3 QT based Dashboard </p>

 <h1><b> Results </h1> </b> 
 
 A latency of 418 milliseconds was achieved using OPC UA ROS driver nodes. Rockwell control loops are usually of 40 milliseconds latency. <br>
 
The aim was to bring the application layer of industrial machines to programming languages like Python and C++. With the help of ROS, all the devices of the industrial machine can be controlled using ROS nodes. Data from the machines can be easily accessed due to the ROS drivers and once ML ROS nodes are written the data can be fed to it.<br>

Ease of programming makes it easier to code complex work sequences for process flexibility.
There can be multiple options to proceed at each step and depending on the order specifications a particular option is executed. Only Python/C++ knowledge is required. No need to know PLC programming languages (after setup). ROS has an action library which lets the user set goals for the system. After a high-level message structure is implemented the machines can be commanded by setting goals and this would enable a more interactive control of the system. Additionally, ROS has a growing and supportive community, this allows for a collaborative growth of the packages and technology.
 


  
  
