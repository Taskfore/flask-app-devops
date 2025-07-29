# DevOps Take-Home Assessment

## Overview
You are tasked with containerizing the provided Flask application and setting up a complete CI/CD pipeline. This assessment evaluates your Docker, CI/CD, and bash scripting skills.

## Prerequisites
- Docker and Docker Compose installed
- GitHub account with access to GitHub Container Registry (GHCR)
- Basic understanding of Flask applications

## Tasks

### 1. Containerization (40 points)

#### 1.1 Create Dockerfile
- Write a production-ready Dockerfile for the Flask application
- Use multi-stage builds to optimize image size
- Run the application as a non-root user for security
- Set appropriate environment variables
- Include health check configuration

#### 1.2 Docker Compose Setup
- Create a `docker-compose.yml` file that includes:
  - Flask application service
  - PostgreSQL database service
  - Proper networking between services
  - Volume persistence for database data
  - Environment variable configuration

#### 1.3 Environment Configuration
- Support for multiple environments (development, production)
- Use `.env` files for environment-specific settings
- Ensure sensitive data is handled securely

### 2. CI/CD Pipeline (35 points)

#### 2.1 GitHub Actions Workflow
Create a GitHub Actions workflow (`.github/workflows/ci.yml`) that:
- Triggers on push to main branch and pull requests
- Runs tests (if any exist)
- Builds Docker image using multi-stage build
- Pushes image to GitHub Container Registry (GHCR)
- Uses semantic versioning for image tags
- Implements proper caching for faster builds

#### 2.2 Image Registry
- Configure authentication with GHCR
- Use appropriate image naming conventions
- Tag images with both commit SHA and semantic versions
- Ensure images are publicly accessible

### 3. Automation Scripts (15 points)

#### 3.1 Bash Scripts
Create the following bash scripts in a `scripts/` directory:

**`setup.sh`**
- Install dependencies and set up the development environment
- Initialize the database
- Create necessary directories and files

**`deploy.sh`**
- Deploy the application using Docker Compose
- Handle environment-specific configurations
- Include proper error handling and logging

**`cleanup.sh`**
- Clean up Docker containers, images, and volumes
- Provide options for selective cleanup
- Include safety checks

### 4. Documentation (10 points)

#### 4.1 Update README.md
- Clear setup and running instructions
- Prerequisites and dependencies
- Environment variable documentation
- Troubleshooting section

#### 4.2 Docker Documentation
- Document the Docker setup
- Explain the multi-stage build process
- Include examples of common Docker commands

## Evaluation Criteria

### Technical Requirements
- [ ] Dockerfile follows best practices (security, optimization)
- [ ] Docker Compose properly orchestrates services
- [ ] CI pipeline successfully builds and pushes images
- [ ] Scripts are robust with proper error handling
- [ ] Application runs correctly in containerized environment

### Best Practices
- [ ] Security considerations implemented
- [ ] Proper resource management and cleanup
- [ ] Environment separation and configuration
- [ ] Code organization and structure
- [ ] Git workflow and commit messages

### Bonus Points (5 points each)
- [ ] Implement container health checks and monitoring
- [ ] Add database migration handling
- [ ] Include linting and security scanning in CI
- [ ] Set up automated testing in the pipeline
- [ ] Implement rolling deployment strategy

## Submission Guidelines

1. Fork this repository
2. Complete all tasks in your fork
3. Ensure your CI pipeline runs successfully
4. Submit a pull request with:
   - Link to your GHCR images
   - Brief explanation of your approach
   - Any assumptions or decisions made

## Time Expectation
This assessment should take approximately 3-4 hours to complete.

## Questions?
If you have any questions about the requirements, please create an issue in your fork and we'll respond promptly.

## Evaluation Notes
We're looking for:
- Clean, maintainable code
- Security-conscious practices
- Understanding of containerization concepts
- Ability to create robust automation scripts
- Clear documentation and communication

Good luck! 🚀