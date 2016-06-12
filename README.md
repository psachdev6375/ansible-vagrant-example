# ansible-vagrant-example
Sets up a microservices application consisting of 4 microservices:
1. Base Service: returns all pizza bases 
2. Pizza Service: Returns all pizzas
3. Topping Service: Returns all toppings 
4. Order Service: Returns all orders 

Netflix Eureka is used for service discovery. It runs on port 8010. Zuul is used as an API Proxy. The above 4 services and Zuul automatically register with Eureka. 

The topology consists of: 
1. DB Server with MySQL 
2. API server with Eureka, Zuul and 4 microservices installed separately

Base OS: Ubuntu Precise 
Base VM for DB Servers: Needs to have MySQL. Ansible provisioning does not install MySQL 
Base VM for API Servers: Should jave JDK8 installed. Ansible provisioning does not install Java

Ansible Provisioning for DB Servers
- Changes the MySQL password for root to 'password'
- Copies config files to ensure the instance binds to 0.0.0.0 and not just localhost 
- Grants priviliges for root to login from anywhere 
- Uploads base data for the application 

Ansible Provisioning for API Servers 
- Copies all distributables 
- Copies conf files in /etc/init to make a service for each 
- Starts all the services 
