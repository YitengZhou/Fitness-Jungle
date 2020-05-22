# System Implementation

With our system design on hand, we are mindful of the importance of a clear software development lifecycle (SDLC) which is the methodology of creating a high-quality software using the shortest time possible. This is accomplished by splitting the project into phases. Some of the most popular SDLC models include the waterfall model, spiral model and Agile model which will be discussed in greater depths in the following sections.

<b>Waterfall Model</b>

 The idea of a waterfall model was one of the first process model proposed by Winston W. Royce in his paper regarding managing the development of large software system in 1970 [1]. In Royce’s article the term “waterfall” was not used and it was an example for a flawed model, which we will discuss later. 

The waterfall model emphasises the logical progression of phases taken throughout the software development life cycle. It is termed the waterfall due to the nature of the model progression, which is like the cascading steps down an incremental waterfall. This means that the next phase of development only begins only if the previous phase is completed, and do not overlap. The waterfall model gained its popularity due to its simplicity. The sequential phases in waterfall are:

* Requirement gathering and analysis – All the possible requirements of the applications are methodically analysed and documented in a requirement specification document.
* System Design – The requirement specifications are studied, and the system design is prepared. 
* Implementation – The system will be developed into small program called units.
* Integration and testing – The units are then integrated into the system after testing each of the individual units. The entire system will then be tested for faults and failure.
* Deployment – Once the testing is completed, the product is then deployed.
* Maintenance – Patches are released to fix problem as well as the possible enhancement of feature or user interfaces.

<b><p align= "center">Table 1: Evaluation of waterfall model</p></b>
|Advantages|Disadvantages|
|:-:|:-:|
|Simple and easy to understand and use|No working software is produced until late in the cycle|
|Easy to manage|High amount of risk and uncertainty|
|Phases are completed one at a time|Not a good model for complex and especially object oriented one|
|Works well in smaller project|Difficult to measure progress within stages|
|Clearly defined stages| Cannot accommodate changing requirement|
|Easy to arrange task|Adjusting scope during life cycle can end a project|
|Process and result well documented|Delayed testing period|


<b>Spiral Model</b>

Spiral model is another important SDLC model, which provides support for risk handling. The model was first introduced by Barry Boehm in his 1986 paper, “A Spiral Model of Software Development and Enhancement”, where he used the term “process model” to refer to the spiral model as well as to incremental, waterfall, prototyping, and other approaches, which indicates that it is actually a combination of iterative development process model and sequential linear development model at early stage, but is quite outstanding for its risk-driven feature.

In its diagrammatic representation, spiral model looks like a spiral with many loops, and loop is called a Phase of the process. The accurate number of loops depends on the specific project, where the project managers can define it according to the project risk. 

<p align = "center" style = "color:red">
<b>Need picture and reference!!!</b></p>

The Radius of the spiral at any point shows the cost of the project so far, and the angular dimension suggests the progress made so far in the current phase. Each phase begins with a goal for the design, ends when the developer or client reviews the progress and is divided into four quadrants as shown in the diagram. The details of these four quadrants are:

* Determine objectives - Requirements are gathered from the customers and the objectives are identified, elaborated and analyzed at the start of every phase. It is important to also identify alternative solutions in case the attempted version fails to perform.
* Identify and resolve risks - Risk analysis should be performed on all possible solutions in order to find any faults or vulnerabilities during this quadrant-- such as running over the budget or areas within the software that could be open to cyber-attacks. Each risk should then be resolved using the most efficient strategy. At the end of this quadrant, Prototype is built for the best possible solution.
* Development and test - During the third quadrant, the identified features are developed and verified through testing. At the end of the third quadrant, the next version of the software is available.
* Plan the next iteration - In the last quadrant, the test results of the newest version are evaluated. This analysis allows programmers to stop and understand what worked and didn’t work before progressing with a new build. At the end of this quadrant, planning for the next phase begins and the cycle repeats. At the end of the whole spiral, the software is finally deployed in its respective market.

Based on its characteristics, the spiral model is best used in large, expensive and complicated projects. Its pros and cons are discussed below:

<b><p align= "center">Table 2: Evaluation of spiral model</p></b>

|Advantages|Disadvantages|
|:-:|:-:|
|Risk handling|Complex|
|Flexibility - Changes made to the requirements during the process can be easily adopted and incorporated|Too much dependable on Risk Analysis - Without very highly experienced expertise, it is going to be a failure to develop a project using this model.|
|Customer satisfaction - The spiral model facilitates customer feedback|Difficulty in time management - The number of phases is unknown at the start of the project, so time estimation is very difficult.|
|Easy to estimate cost of the whole project| Expensive, not suitable for small projects|

<b>Agile Model</b>
Agile model is also a type of Incremental model. Software is developed in incremental, rapid cycles. This results in small incremental releases with each release building on previous functionality. Each release is thoroughly tested.

<p align = "center" style = "color:red">
<b>Need picture and reference!!!</b></p>

Unlike the Waterfall model, the development team ultimately decides at the beginning of a sprint (or iteration) what can be accomplished in the timeframe and sets out to build a series of features, delivering working software that can be installed in a production environment at the end of the sprint, which meets the demand for faster software development.

There are various approaches adhering to Agile, including, but not limited to:
* Scrum
* Crystal
* Dynamic Software Development Method (DSDM)
* Feature Driven Development (FDD)
* Lean Software Development
* Extreme Programming (XP)

<p align = "center" style = "color:red">
<b>Need picture and reference!!!</b></p>

Importantly, the Agile software development lifecycle is dominated by the iterative process. Each iteration results in the next piece of the software development puzzle. There are different expressions regarding the stages in an iteration process, but most are similar in general. A typical example is as follows:
* Requirements - Define the requirements for the iteration based on the product backlog, sprint backlog, customer and stakeholder feedback.
* Design - When the project has been identified, the team should work with stakeholders to define requirements. Flow diagram or the high-level UML diagram can be used to show the work of new features.
* Development - When the team defines the requirements, the work begins. Designers and developers start working on their project, which aims to deploy a working product. The product will undergo various stages of improvement, so it includes simple, minimal functionality.
* Testing - QA (Quality Assurance) testing, internal and external training, documentation development.
* Deployment - Integrate and deliver the working iteration into production
* Review/Feedback - Accept customer and stakeholder feedback and work it into the requirements of the next iteration.


<b><p align= "center">Table 3: Evaluation of agile model</p></b>
|Advantages|Disadvantages|
|:-:|:-:|
|Frequent Delivery|Lack of emphasis on necessary designing and documentation|
|Face-to-Face Communication with clients|The project can easily get taken off track if the customer representative is not clear what results that they want|
|Efficient design and fulfils the business requirement|Only senior programmers can take the kind of decisions required during the development process|
|Anytime changes are acceptable|In case of some software deliverables, especially the large ones, it is difficult to assess the effort required at the beginning of the software development life cycle|
|Reduce total development time| |
|Continuous attention to technical excellence and good design| |

<p align = "center" style = "color:red">
<b>???missing column!!!</b></p>

<b>Choice of SDLC methodology</b>

By contrasting the different models for software development, we decide to go for the Agile approach for the following few reasons. Firstly, the Agile approach has a few immediate advantages over traditional method such as the waterfall model due to its nature of being flexible. Although the rigidity of the waterfall model does prove to be very efficient in completing task phase by phase, and also the methodology can be explained with ease to ammeter coder there are inherent risk in this approach one of the most obvious being the lack to unit testing. Secondly, due to our idea and features for the project constantly evolving as we are implementing new features, so the Agile model fits our requirement as it features frequent check-ins which allow for changes to be made constantly. Whereas in the waterfall model, due to the linear progression does not encourage phases to be revisited.  Thirdly, the Agile methodology is way faster overall compared to the other methodology because far less re-work or major changes are made when progressing as most issues and changes are identified in the early stages.

## Breakdown of project into sprints
As mentioned above in our system implementation we decided on the agile approach which features breaking down of project into sprints. Sprint planning is part of the scrum framework where we will determine what to work on in each of the sprint and discuss the initial plan for completing these backlog items. The figure below is a graphical representation of our sprint cycle and the detailed backlogs items derived from our user stories can be seen at (reference start of backlog) here.

<p align="center">
<img src="Images/implementation/sprint.jpg">
</p>
<b><p align= "center">Figure 1: The agile model for Fitness Jungle </p></b>

### M5 Product Backlog
<b><p align= "center">Table 4: M5 Product Backlog</p></b>

|Priority|Backlog Item|User Story ID|User Story|Estimated time (hours)|
|:-:|:-:|:-:|:-:|:-:|
|1|Application setup|-|-|3|
|2|MQTT connectivity|-|-|8|
|3|View user details|5|As a user, I want to view my details on my device, so that I can identify my device.|15|
|4|View pet details|3|As a user, I want to view my virtual pet details, so that I can see its progress.|26|
|5|View steps|2|As a user, I want to track my steps and calories, so that I can know my daily step count.|12|
|6|View activity report|1|As a user, I want to view my activity report, so that I can better plan my exercise regime.|17|
|7|User login|4|As a user, I want to be able to log in, so that I can access the application.|17|
|8|Send step updates|8|As a user, I want to send my steps to server, so that I can track my steps and calories.|2|
|9|Map system|7|As a user, I want to check the map and track my movement route, so that I can look back and see what I have been today.|18|
|10|Friend system|6|As a user, I want to view and add friends, so that I can interact with my friends.|14|
|11|View health report|9|As a user, I want to receive my health report, so that I can see my sport progress.|15|

### Desktop Product Backlog
<b><p align= "center">Table 5: Desktop Product Backlog</p></b>
|Priority|Backlog Item|User Story ID|User Story|Estimated time (hours)|
|:-:|:-:|:-:|:-:|:-:|
|1|Application setup|-|-|3.5|
|2|MQTT connectivity|-|-|3.5|
|3|View user information|2|As a developer, I want to be able to view information about any user, so I can tailor specific health feedback to them.|22.5|
|4|View user statistics|3|As a developer, I want to be able to view a graphical representation of my user’s usage statistics, so that I can have a better understanding about the user’s usage.|17.5|
|5|Add pets|4|As a developer, I want to be able to add new virtual pets and pet skins, so that the users will have a variety to pet and pet skins to choose from.|15|
|6|View pets|6|As a developer, I want to be able to view virtual pets and pet skins, so that I can see the list currently available to the users.|1|
|7|Modify pets|5|As a developer, I want to be able to modify virtual pets and pet skins, so that I can make updates to the designs.|15|
|8|Admin authentication|1|As a developer, I want to be able to log in to the application, so that I can be authenticated to view privileged information about my users.|15|
|9|Logging System|7|As a developer, I want to be able to view all the changes made on the desktop application, so that I can revert to previous state if a bug was produced.|20|

### Web Product Backlog 
<b><p align= "center">Table 6: Web Product Backlog </p></b>
|Priority|Backlog Item|User Story ID|User Story|Estimated time (hours)|
|:-:|:-:|:-:|:-:|:-:|
|1|Application setup|-|-|5|
|2|User account|1|As a user, I want to register an account, log in and link my M5Stack to it, so that I can start playing the game.|10|
|3|View profiles|2|As a user, I want to view my profile and pet information, so that I can identify my account and view my pet’s progress.|8|
|4|Update profile|4|As a user, I want to edit my profile and pet status, so that I can make changes should I want to.|10|
|5|Friend system|5|As a user, I want to view my friends list, so that I can interact with my friends.|12|
|6|Step count report|3|As a user, I want to view a report about my daily steps, so that I can monitor my daily activity.|10|
|7|Map system|6|As a user, I want to check my daily route on the map, so that I can look back at and see where I have been today.|18|

### Server Product Backlog
<b><p align= "center">Table 7: Server Product Backlog </p></b>
|Priority|Backlog Item|For sub-system|User Story ID|Estimated time (hours)|
|:-:|:-:|:-:|:-:|:-:|
|1|Server setup|-|-|3|
|2|Database Creation|-|-|22|
|3|Register new user (HTTP)|Web|1|5|
|4|Authenticate user (HTTP)|Web|1|5|
|5|Get user details (HTTP)|Web|2|5|
|6|Update user details (HTTP)|Web|4|5|
|7|Get pet types (HTTP)|Web|4|5|
|8|Create user’s pet (HTTP)|Web|4|5|
|9|Get user’s pets (HTTP)|Web|2|5|
|10|Update user’s pet (HTTP)|Web|4|5|
|11|Set user’s active pet (HTTP)|Web|4|5|
|12|Get user and active pet details (MQTT)|M5stack|5|5|
|13|Send step count update (MQTT)|M5stack|3|5|
|14|Get list of users (MQTT)|Desktop|2|5|
|15|Get user details (MQTT)|Desktop|2|5|
|16|Get user’s step count updates within|Desktop|-|5|
|17|Register device (MQTT)|M5stack|3|5|
|18|Authenticate admin (MQTT)|Desktop|4|5|

<b>Sprint 1: Building user interfaces and API design</b>

In this sprint, we will not be building the full features but rather just the user interfaces. This is a little unconventional since a sprint cycle usually takes a feature through design to implementation. However, the team felt that it will be more beneficial if we started with the building of the user interfaces to make clear of the data requirements and allow a more coherent flow of the applications. This will also allow for a better API design as the API designer will have an overview of the data required by the different clients and be able to build more general-purpose APIs that can be shared by clients. This contrasts with building APIs with each feature implementation, which can result in APIs with narrow scopes and increase data redundancy in APIs. In addition, making any API changes will result in previous implemented features having to be modified to keep with the changes. Thus, to reduce API changes and have a better application design flow, the team decided to take an unconventional approach in the first sprint. 

At this stage, the meetings are held every 2 days instead of daily as advocated in Scrum. This is due to the reason that more time is required for coming up with designs before holding meetings. An end of sprint meeting is held to discuss about the sprint that just happened, and to identify the areas we did well and the areas to improve. In particular, the team felt that the meetings held every other day are great in keeping everyone on the same page. However, we felt that the communication of requirements is not as active as we will like and will work on it for subsequent sprints. We also reviewed and confirmed on the design details and decided on details for the next sprint.

### M5Stack Sprint 1 Backlog
<b><p align= "center">Table 8: M5Stack Sprint 1 Backlog</p></b>
Priority|Product Backlog Item|User Story ID|Estimated time (hours)
|:-:|:-:|:-:|:-:|
|1|<b>Application setup|-|3
| |Setup M5Stack environment and import relevant modules| |3
|2|<b>View user details (user interface)|5|6
| |Designing user details page| |3
| |Creating user details page| |3
|3|<b>View pet details (user interface)|3|10
| |Designing pet details page| |5
| |Creating pet details page| |5
|4|<b>View steps (user interface)|2|4
| |Designing track steps page| |2
| |Creating track steps page| |2
|5|<b>View activity report (user interface)|1|6
| |Designing report page| |2
| |Creating report page| |4
|6|<b>User login (user interface)|4|9
| |Designing logo page| |1.5
| |Creating logo page| |1.5
| |Designing login page| |1.5
| |Creating login page| |1.5
| |Designing keyboard plug-in unit| |1.5
| |Creating keyboard plug-in unit| |1.5

### Desktop Sprint 1 Backlog
<b><p align= "center">Table 9: Desktop Sprint 1 Backlog</p></b>
Priority|Product Backlog Item|User Story ID|Estimated time (hours)
|:-:|:-:|:-:|:-:|
|1|<b>Application setup|-|2.5
| |Create a setup method for the processing window| |1
| |Create a draw method for setting background of window| |1
| |Create a dashboard class for the methods such as building of display elements| |0.5
|2|<b>View user Information (user interface)|2|4
| |Create an element that loads picture from web, resize image and appropriately displaying image at a suitable position| |0.5
| |Create an element that display user information such as username, first name, etc. (Static information)| |0.5
| |Create a dropdown list to display all the different user registered in the database| |2
|3|<b>View user statistics (user interface)|3|3.5
| |Create an element that display user basic statistic such as daily steps, weekly steps and average daily steps (Static information)| |0.5
| |Create an element that plot bar chart for daily steps by hourly basis and weekly steps daily basis (Static information)| |3

### Web Sprint 1 Backlog
<b><p align= "center">Table 10: Web Sprint 1 Backlog</p></b>
Priority|Product Backlog Item|User Story ID|Estimated time (hours)
|:-:|:-:|:-:|:-:|
|1|<b>Application setup|-|2
| |Setup Vue.js and import relevant libraries| |2
|2|<b>User account (user interface)| 1|4
| |Log in page framework| | 2
| |Log in page CSS| | 2
|3|<b>View profile (user interface)| 2| 4
| |Profile page framework| | 2
| |Profile page CSS| | 2
|4|<b>Update profile (user interface)|4|4
| |Profile edit page framework| | 2
| |Profile edit page CSS| | 2
|5|<b>Friend system (user interface)| 5| 6
| |Friend component| | 2
| |Friend component CSS| | 2
| |Friend list page| |1
| |Friend list page CSS| | 1
|6|<b>Map system (user interface)| 6|2
| |Map page framework| | 1
| |Map page CSS| |1

Server Sprint Backlog
Priority|Product Backlog Item|For sub-system|User Story ID|Estimated time (hours)
|:-:|:-:|:-:|:-:|:-:|
|1|Database Creation (Design)|-|-|10
||Design User table||1
||Design BasePetType table||1
||Design PetType table||1
||Design PetLevel table||1
||Design UserPet table||1
||Design UserIntervalStep table||1
||Design UserPetIntervalStep table||1
||Design Friend table||1
||Design FriendStatus table||1
||Design Admin table||1
|2|Register new user (HTTP) API Design|Web|1|1
|3|Authenticate user (HTTP) API Design|Web|1|1
|4|Get user details (HTTP) API Design|Web|2|1
|5|Update user details (HTTP) API Design|Web|4|1
|6|Get pet types (HTTP) API Design|Web|4|1
|7|Create user’s pet (HTTP) API Design|Web|4|1
|8|Get user’s pets (HTTP) API Design|Web|2|1
|9|Update user’s pet (HTTP) API Design|Web|4|1
|10|Set user’s active pet (HTTP) API Design|Web|4|1
|11|Get user and active pet details (MQTT) API Design|M5Stack|5|1
|12|Send step count update (MQTT) API Design|M5Stack|3|1
|13|Get list of users (MQTT) API Design|Desktop|2|1
|14|Get user details (MQTT) API Design|Desktop|2|1
|15|Get user’s step count updates within interval (MQTT) API Design|Desktop|3|1
|16|Register device (MQTT) API Design|M5Stack|4|1
|17|Authenticate admin (MQTT) API Design|Desktop|1|1

<b>Sprint 2: First wave of implementation</b>

In this sprint, we start off the first wave of feature implementations. The server is added with the APIs required by the different sub-systems, developing in the sequence shown in the user sequence diagram. The different sub-systems build on from the user interfaces and establish communication with the server via API calls to retrieve the required data. In particular, for the desktop application, the time required to build the user interfaces exceed the initial expectations in the previous sprint and thus a portion of this sprint will be to continue building the user interfaces alongside implementing features.


## Details of evaluation for designs

## Discussion of Social and Ethical implications of the work