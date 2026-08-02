# Developer Documentation

This document outlines the setup, build process, and architectural details required for developers working on this project.

## 1. Setting Up the Environment
Before building the project, ensure your local development environment meets the necessary prerequisites and configuration.

### Prerequisites
*   **Docker:** Must be installed and running.
*   **Docker Compose:** Required for orchestrating the multi-container setup.
*   **Make:** Required to utilize the provided `Makefile`.

### Configuration Files and Secrets
1.  Clone the repository to your local machine.
2.  **Environment Variables:** Copy the sample environment file to create your local configuration.
    ```bash
    cp .env.example meow.env
    ```
    Populate the `meow.env` file with the required local development values (e.g., database user, ports).

## 2. Building and Launching the Activity
The build lifecycle is fully automated using the provided `Makefile`.

*   **Build the images and launch containers:**
    ```bash
    make all
    ```
*   **Rebuild specific components:** If you modify a Dockerfile or configuration, force a rebuild without utilizing the Docker cache:
    ```bash
    make re
    ```
*   **Stop and remove containers, networks, and images:**
    ```bash
    make stop
    ```

## 3. Container and Volume Management
Here are the essential Docker/Compose commands for managing the development environment:

*   **View active containers:** `docker compose ps`
*   **Access a running container's shell (for debugging):** 
    ```bash
    docker exec -it [container_name] /bin/bash
    ```
*   **View system resource usage:** `docker stats`

## 4. Data Storage and Persistence
Stateful data in this architecture is decoupled from the compute containers to prevent data loss upon container destruction.

*   **Where data is stored:** We use **Docker Volumes** to persist application data and database records. 
*   **How it persists:** Volumes are declared in the `docker-compose.yml` file. For instance, the database volume might be mapped to `/var/lib/mysql` inside the database container.
*   **Host Location:** The actual data resides in the host machine's directory `/home/klafi/data/` on Linux managed by the Docker daemon. It is completely isolated from the container's ephemeral write layer.
*   **Inspection:** To view the created volumes and their details, use:
    ```bash
    docker volume ls
    docker volume inspect [volume_name]
    ```