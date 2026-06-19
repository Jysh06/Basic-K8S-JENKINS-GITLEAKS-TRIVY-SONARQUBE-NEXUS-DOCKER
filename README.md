<img width="1866" height="843" alt="ChatGPT Image Jun 20, 2026, 12_04_08 AM" src="https://github.com/user-attachments/assets/53318d09-4468-4e70-a473-a3cb57de245b" /># Basic K8S-JENKINS-GITLEAKS-TRIVY-SONARQUBE-NEXUS-DOCKER

## 📌 Overview

This project demonstrates a complete **DevSecOps CI/CD Pipeline** that integrates security, code quality, artifact management, containerization, and Kubernetes deployment.

The pipeline automates the software delivery lifecycle from source code checkout to deployment on a Kubernetes cluster while performing multiple security and quality checks throughout the process.

---

## 🏗️ Architecture

```text
GitHub
   │
   ▼
Jenkins Pipeline
   │
   ├── Gitleaks Scan
   ├── Maven Compile & Test
   ├── Trivy Filesystem Scan
   ├── SonarQube Analysis
   ├── Quality Gate Validation
   ├── Maven Package
   ├── Nexus Artifact Deployment
   ├── Docker Build
   ├── Trivy Image Scan
   ├── Docker Hub Push
   └── Kubernetes Deployment
                │
                ▼
          Kubernetes Cluster
```

---

## ⚙️ CI/CD Pipeline Flow

### 1. Source Code Checkout

* Fetches the latest application source code from GitHub.

### 2. Gitleaks Security Scan

* Scans the repository for:

  * Hardcoded secrets
  * API keys
  * Passwords
  * Access tokens
  * Credentials

### 3. Maven Compile & Test

* Compiles the Java application.
* Executes unit tests to validate application functionality.

### 4. Trivy Filesystem Scan

* Scans project dependencies and filesystem for vulnerabilities.

### 5. SonarQube Analysis

* Performs static code analysis.
* Detects:

  * Bugs
  * Vulnerabilities
  * Code smells
  * Technical debt

### 6. SonarQube Quality Gate

* Validates quality gate conditions before proceeding further.

### 7. Maven Package

* Generates the application artifact (JAR file).

### 8. Nexus Artifact Deployment

* Publishes build artifacts to Nexus Repository Manager.

### 9. Docker Image Build

* Builds a Docker image from the generated artifact.

### 10. Trivy Docker Image Scan

* Scans container images for known vulnerabilities.

### 11. Docker Hub Push

* Pushes the validated Docker image to Docker Hub.

### 12. Kubernetes Deployment

* Deploys the application to a Kubernetes cluster using:

  ```bash
  kubectl apply -f deployment-service.yml
  ```

---

## 🛠️ Tech Stack

| Category               | Tools                    |
| ---------------------- | ------------------------ |
| Source Control         | GitHub                   |
| CI/CD                  | Jenkins                  |
| Build Tool             | Maven                    |
| Language               | Java 17                  |
| Secret Scanning        | Gitleaks                 |
| Vulnerability Scanning | Trivy                    |
| Code Quality           | SonarQube                |
| Artifact Repository    | Nexus Repository Manager |
| Containerization       | Docker                   |
| Container Registry     | Docker Hub               |
| Orchestration          | Kubernetes (Kubeadm)     |

---

## 🔐 Security Controls Implemented

### Gitleaks

Detects exposed:

* API Keys
* Tokens
* Passwords
* Secrets

### Trivy Filesystem Scan

Identifies:

* Vulnerable dependencies
* Misconfigurations
* Security issues

### Trivy Image Scan

Detects:

* OS package vulnerabilities
* Container image security risks
* Critical and high-severity CVEs

### SonarQube

Ensures:

* Code quality
* Security best practices
* Maintainability standards

---

## 📦 Artifact Management

Nexus Repository Manager is used to:

* Store versioned build artifacts
* Manage Maven packages
* Enable artifact traceability
* Support build reproducibility

---

## ☸️ Kubernetes Deployment

The application is deployed on a Kubernetes cluster created using **Kubeadm**.

Deployment includes:

* Kubernetes Deployment
* Kubernetes Service
* Rolling Update support
* Scalable architecture

---

## 🎯 Key Learnings

One of the most valuable lessons from this project was understanding how security can be integrated throughout the CI/CD pipeline rather than being treated as a final step.

By combining:

* 🔐 Gitleaks for secret detection
* 🛡️ Trivy for vulnerability scanning
* 📊 SonarQube for code quality analysis
* 📦 Nexus for artifact management
* 🐳 Docker for containerization
* ☸️ Kubernetes for deployment

I built a complete end-to-end DevSecOps workflow that automates code validation, security scanning, artifact management, container delivery, and Kubernetes deployment.

---

## 👨‍💻 Author

**Jayesh Patil**

