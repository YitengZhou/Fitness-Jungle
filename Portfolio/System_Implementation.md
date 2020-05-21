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
|Customer satisfaction - The spiral model facilitates customer feedback|
|Difficulty in time management - The number of phases is unknown at the start of the project, so time estimation is very difficult.|
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

## Details of evaluation for designs

## Discussion of Social and Ethical implications of the work