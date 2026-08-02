*This activity has been created as part of the 42 curriculum by klafi*

# Description
This activity consists of setting up a small infrastructure composed of different services
under specific rules. The whole project is done in a virtual machine. You have to use docker compose.
Each Docker image has the same name as its corresponding service.
Each service is run in a dedicated container.
For performance reasons, the containers are built from the penultimate stable version
of Debian.
All Dockerfiles are built by hand, one per service. The Dockerfiles are
called in the docker-compose.yml by the Makefile.
It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian
being excluded from this rule).

# Instructions
To start running all containers, write `make` to build all containers and set the web server running. To open the website, open the url `localhost:443` or `https://klafi.42.fr`.
To stop all containers, write `make stop` in the terminal.

# Resources
The majority of the resources I used were youtube videos, official documentation was so sophisticated and obscure most of the time.
- https://youtu.be/VXmvM2QtuMU?list=PLIzzai5cReIPAj9-Co7RVJIBBr9VdL2GO
- https://youtu.be/9J1nJOivdyw
- https://youtu.be/NLeaZx-cOAw?si=8q1WzM3OCbY0hpZ5

# What’s the Difference Between Docker and a VM?
Docker and virtual machines (VMs) are two technologies used in application deployment. In the software development lifecycle, deployment prepares the application code to run for your end users. Docker is an open-source platform that developers use to package software into standardized units called containers. The container has both the application code and its environment, including libraries, system tools, and runtime. Using Docker, you can deploy and scale applications on any machine and ensure your code runs consistently. In contrast, a virtual machine is a digital copy of a physical machine. You can have multiple virtual machines with their own individual operating systems running on the same host operating system. Developers configure the virtual machine to create the application’s environment. It’s also possible to run Docker containers on virtual machines.


## Virtualization: Docker vs. virtual machine
Virtualization allows the creation of a virtual instance of real-life resources, such as servers and networks. In computing, virtualization allows multiple isolated instances of a virtualized component to operate on the real-life component.

For example, multiple virtual servers could run on a physical server. By sharing real-life resources among multiple virtual instances, they’re better utilized and more cost-effective to run. Virtualization is the basis of a significant amount of application development and deployment.

## Virtual machines
As the name suggests, virtual machines (VMs) provide virtualization of an entire machine (server). A virtual machine emulates the hardware components of a physical machine, such as the CPU, memory, network interface card, USB controllers, and sound cards. You can run a guest operating system and multiple applications in the virtual environment. 

## Docker
A VM lets you run a virtual machine on any hardware. Docker lets you run an application on any operating system. It uses isolated user-space instances known as containers.

Docker containers have their own file system, dependency structure, processes, and network capabilities. The application has everything it requires inside the container and can run anywhere. Docker container technology uses the underlying host operating system kernel resources directly. 

# Docker secrets VS environment variables

The actual difference
An environment variable is a delivery mechanism: a way to get configuration into a process without baking it into code. This is [twelve-factor config](https://12factor.net/config), and it's still the right default — config varies between deploys, code doesn't, so config lives in the environment.

A secret is a property of the *value*, not the mechanism: anything that grants access or capability. API keys, database passwords, signing keys, OAuth client secrets, webhook signing tokens. The test is simple: if this value appeared in a public GitHub repo, would you have to rotate it? If yes, it's a secret. If no — port numbers, feature flags, log levels, public API base URLs — it's plain config.

# Docker Network vs. Host Network

| Feature | Docker Network (Bridge) | Host Network |
| :--- | :--- | :--- |
| **Isolation** | High (Isolated network namespace, requires explicit port mapping) | None (Container uses the host's networking stack directly) |
| **Performance** | Slight overhead due to Network Address Translation (NAT) | Native host performance (No NAT routing overhead) |
| **Port Conflicts** | Easily avoided (Internal ports can map to any host port) | High risk (Cannot use a port if the host is already using it) |
| **Best For** | Standard web applications, database communication | High-throughput applications, network traffic analyzers |

# Docker Volumes vs. Bind Mounts

| Feature | Docker Volumes | Bind Mounts |
| :--- | :--- | :--- |
| **Management** | Managed entirely by the Docker daemon | Managed by the host operating system's filesystem |
| **Portability** | High (Independent of the host machine's directory structure) | Low (Hardcoded to specific directory paths on the host) |
| **Security** | Safer (Isolated from critical host system files) | Riskier (Containers can potentially modify host system files) |
| **Best For** | Database persistence, sharing data between containers safely | Injecting source code during local development for live-reloading |

