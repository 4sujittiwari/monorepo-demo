# Spring Boot Gradle Monorepo

This is a multi-service monorepo built with Spring Boot and Gradle, incorporating best practices from Google, Meta, and Microsoft.

## Project Structure

```text
.
├── build.gradle            # Root build file for common configuration
├── settings.gradle         # Project structure definition
├── gradle.properties       # Global build properties
├── Dockerfile              # Standardized multi-stage Dockerfile
├── docker-compose.yml       # Local orchestration
├── gradle/
│   └── libs.versions.toml  # Centralized Version Catalog
├── libraries/
│   └── common/             # Shared library for common models/utils
└── services/
    ├── user-service/       # Example service A
    └── order-service/      # Example service B
```

## Best Practices Implemented

1. **Centralized Dependency Management**: Uses Gradle **Version Catalogs** (`libs.versions.toml`) to ensure consistent versions across all services.
2. **Shared Infrastructure**: A `libraries/common` module allows sharing code (e.g., base response objects, utilities) between services without duplication.
3. **Atomic Builds**: The root `build.gradle` manages common plugins and configurations, ensuring a homogeneous build environment.
4. **Optimized Build Configuration**: Configured with parallel builds and caching (`gradle.properties`).
5. **Standardized Deployment**: Uses a single, multi-stage `Dockerfile` and `docker-compose.yml` for consistent service deployment.
6. **Low-Coupling, High-Cohesion**: Services are kept in the `services/` directory, while shared logic remains in `libraries/`.

## How to Build and Run

### Build everything
```bash
./gradlew build
```

### Run a specific service
```bash
./gradlew :services:user-service:bootRun
./gradlew :services:order-service:bootRun
```

### Run using Docker Compose
```bash
docker-compose up --build
```

## Common Tasks

- **Adding a new library**: Create a folder in `libraries/`, add it to `settings.gradle`, and include it in service dependencies.
- **Updating a version**: Modify `gradle/libs.versions.toml`.
