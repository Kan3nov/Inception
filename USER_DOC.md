# User Documentation

Welcome to the user documentation for klafi.42.fr. This guide explains how to interact with the system, manage its services, and verify that everything is functioning correctly.

## 1. Services Provided by the Stack
This infrastructure automatically deploys and manages a stack of containerized services to run our application seamlessly. The primary services provided include:
*   **Web Server (Frontend):** Serves the main website to users.
*   **Application Server (Backend):** Handles the core logic and API requests.
*   **Database System:** A secure relational database that stores all application data.
*   **Administration Panel:** A web-based interface for managing the backend, user data, and system configurations.

## 2. Starting and Stopping the Activity
The entire stack is managed via simple terminal commands using a `Makefile`.

*   **To start the application:** Open your terminal at the root of the repository and run:
    ```bash
    make start
    ```
    This will initialize and start all necessary services in the background.

*   **To stop the application:** When you are finished, you can safely shut down the services by running:
    ```bash
    make stop
    ```

## 3. Accessing the Website and Administration Panel
Once the activity is successfully started, you can access the services using a standard web browser.

*   **Main Website:** Open your browser and navigate to `[Insert Website URL, e.g., http://localhost]` or `[https://klafi.42.fr]`.
*   **Administration Panel:** Navigate to `e.g., http://localhost/wp-admin]` or `https://klafi.42.fr/wp-admin`. You will be prompted to log in using the administrator credentials.

## 4. Locating and Managing Credentials
For security reasons, credentials are not hardcoded into the source code.
*   **Location:** All usernames, passwords, and API keys are stored in a `.env` file located in the "srcs" directory.
*   **Management:** To update a credential, an administrator must edit the `.env` file. *Note: If you change credentials, you must restart the stack (using `make stop` and `make start`) for the changes to take effect.*

## 5. Checking that Services are Running Correctly
If you need to verify that all parts of the application are online and healthy, run the following command in your terminal:
```bash
docker ps
```
This will display a list of all active containers. You should check that the STATUS column for all relevant containers says Up.
To view the live output and catch any potential errors, you can check the logs by running:
```bash
docker compose logs -f
```