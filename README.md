
# Test Environment: 

To implement and run the automated tests for Horizon UI Dashboard, I have two options 

* Build the application in local and use it for automated tests
* Use hosted application i.e, https://horizon-ui.com/horizon-ui-chakra/?ref=readme-horizon

### Advantages and Disadvantages of above approaches

- The disadvantage with option (b) is, if something is down or if there is any technical glitch in the hosted environment, the app will not be available for testing. I would just treat this like a hosted shared environment.

- Advantage with option (a) is, I can bring the application up and running before I start running the tests. Imagine, if I found an issue, developers made a fix, I pulled the code and restarted the app again. I don't need to wait till the change is available in a "shared environment". 

Hence Option (a) is chosen.

### Containerisation of test execution

- In order to implement an End-to-end test execution approach, including a test report, I decided to use a containersized approach with the help of Docker. 
- I will start two containers, one for app and one for tests and both communicate over Docker's default Bridge network.
- Application will be started in the first container and it's available to the second container in which playwright E2E tests will run. 
- Once the test execution is done, allure report is generated and available on port 8089 (default configuration)

- It's possible to change the port by passing "HOST_PORT" environment variable. 

NOTE: Please be noted that these steps will vary when running the tests inCI.

## How to run tests in Local Machine:

### Pre-requisites:

* Install Docker Desktop (Version 4.6.2) and start it
* Git is installed (Version 2.39.0)

## Steps to Follow:

* Clone the repository using below command

   ```git clone --recurse-submodules https://github.com/AnjiB/play-rightly-in-local.git```


* Cd into the folder ```play-rightly-in-local```
* Run the command ```docker-compose up```. This will bring the whole setup, start the development server on port 3000 (http://www.localhost:3000/), run the tests and bring the allure report on port 8089. 
* If you want to change the port of the allure report & browser name, please update .env file and run
  ```docker-compose up``` command
