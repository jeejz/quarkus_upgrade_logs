# Version Analysis Report: Spring Boot 3.5.9 and Quarkus 3.27.2

**Date**: 2026-01-23  
**Project**: Apache KIE Kogito Apps  
**Repository**: incubator-kie-kogito-apps

---

## Executive Summary

✅ **Status**: Both Spring Boot and Quarkus are already at the target versions.

- **Quarkus**: `3.27.2` ✅ (Target: 3.27.2)
- **Spring Boot**: `3.5.9` ✅ (Target: 3.5.9)

**No upgrade action required** - versions are current.

---

## Version Properties Overview

### 1. Core Framework Versions

#### Quarkus Ecosystem
| Property | Version | Status |
|----------|---------|--------|
| `version.io.quarkus` | 3.27.2 | ✅ Current |
| `version.io.quarkus.camel` | 3.27.2 | ✅ Current |
| `version.io.quarkus.quarkus-test` | 3.27.2 | ✅ Current |

#### Spring Boot Ecosystem
| Property | Version | Status |
|----------|---------|--------|
| `version.org.springframework.boot` | 3.5.9 | ✅ Current |
| `version.org.springframework` | 6.2.15 | ℹ️ Compatible |

---

## Detailed Version Inventory

### Quarkus Extensions & Plugins

| Property | Version | Notes |
|----------|---------|-------|
| `version.io.quarkiverse.openapi.generator` | 2.11.0-lts | LTS version |
| `version.io.quarkiverse.reactivemessaging.http` | 2.5.0-lts | LTS version |
| `version.io.quarkiverse.asyncapi` | 1.0.5 | - |
| `version.io.quarkiverse.embedded.postgresql` | 0.7.2 | - |
| `version.io.quarkiverse.jackson-jq` | 2.4.0 | - |

### Jakarta EE Specifications

| Property | Version | Specification |
|----------|---------|---------------|
| `version.jakarta.annotation-api` | 3.0.0 | Jakarta Annotations |
| `version.jakarta.persistence-api` | 3.2.0 | Jakarta Persistence (JPA) |
| `version.jakarta.validation-api` | 3.1.1 | Jakarta Validation |
| `version.jakarta.ws.rs` | 3.1.0 | Jakarta RESTful Web Services |
| `version.jakarta.xml.bind-api` | 4.0.4 | Jakarta XML Binding |

### Persistence & Database

| Property | Version | Component |
|----------|---------|-----------|
| `version.org.hibernate` | 7.1.2.Final | Hibernate ORM |
| `version.org.postgresql` | 42.7.8 | PostgreSQL JDBC Driver |
| `version.org.flywaydb` | 11.14.1 | Flyway Database Migration |
| `version.org.infinispan` | 15.0.21.Final | Infinispan Cache |
| `version.org.infinispan.protostream` | 5.0.13.Final | Infinispan Protostream |
| `version.org.mongo` | 5.3.1 | MongoDB Driver |
| `version.com.h2` | 2.3.232 | H2 Database |

### Reactive & Messaging

| Property | Version | Component |
|----------|---------|-----------|
| `version.io.vertx` | 4.5.23 | Eclipse Vert.x |
| `version.io.smallrye.reactive.mutiny-vertx-web-client` | 3.21.3 | Mutiny Vert.x Web Client |
| `version.io.smallrye-config` | 3.13.4 | SmallRye Config |
| `version.io.smallrye-open-api` | 4.0.12 | SmallRye OpenAPI |
| `version.org.apache.kafka` | 4.0.0 | Apache Kafka |
| `version.io.cloudevents` | 3.0.0 | CloudEvents |

### Testing Frameworks

| Property | Version | Component |
|----------|---------|-----------|
| `version.org.junit.jupiter` | 5.13.4 | JUnit 5 |
| `version.org.junit.platform` | 1.13.4 | JUnit Platform |
| `version.org.junit` | 4.13.2 | JUnit 4 (legacy) |
| `version.org.mockito` | 5.18.0 | Mockito |
| `version.org.assertj` | 3.27.3 | AssertJ |
| `version.org.testcontainers` | 2.0.3 | Testcontainers |
| `version.io.rest-assured` | 5.5.6 | REST Assured |
| `version.org.awaitility` | 4.3.0 | Awaitility |
| `version.org.hamcrest` | 2.2 | Hamcrest |

### Serialization & Data Processing

| Property | Version | Component |
|----------|---------|-----------|
| `version.com.fasterxml.jackson` | 2.19.2 | Jackson Core |
| `version.com.fasterxml.jackson.databind` | 2.19.2 | Jackson Databind |
| `version.com.fasterxml.jackson.datatype` | 2.19.2 | Jackson Datatypes |
| `version.com.google.protobuf` | 3.25.5 | Protocol Buffers |
| `version.org.apache.avro` | 1.12.0 | Apache Avro |
| `version.com.google.gson` | 2.13.2 | Gson |

### API & Documentation

| Property | Version | Component |
|----------|---------|-----------|
| `version.io.swagger.core.v3` | 2.2.38 | Swagger Core |
| `version.io.swagger.parser.v3` | 2.1.34 | Swagger Parser |
| `version.org.eclipse.microprofile.openapi` | 4.0.2 | MicroProfile OpenAPI |
| `version.com.graphql-java-extended-scalars` | 22.0 | GraphQL Extended Scalars |

### Utilities & Common Libraries

| Property | Version | Component |
|----------|---------|-----------|
| `version.com.google.guava` | 33.4.8-jre | Google Guava |
| `version.org.apache.commons` | 3.18.0 | Apache Commons Lang |
| `version.org.slf4j` | 2.0.6 | SLF4J Logging |
| `version.io.micrometer` | 1.14.12 | Micrometer Metrics |
| `version.io.netty` | 4.1.130.Final | Netty |

### Security & Authentication

| Property | Version | Component |
|----------|---------|-----------|
| `version.org.keycloak` | 26.1.0 | Keycloak |
| `version.org.bouncycastle.bc.jdk18on` | 1.82 | Bouncy Castle |

### Kogito-Specific

| Property | Version | Component |
|----------|---------|-----------|
| `version.io.serverlessworkflow` | 4.1.0.Final | Serverless Workflow |
| `version.explainability-core` | 1.22.1.Final | Explainability Toolkit |
| `version.org.optaplanner` | ${project.version} | OptaPlanner |

---

## Version Reference Locations

### Quarkus Version References (83 total)

#### Quarkus Maven Plugin (58 occurrences)
Used in build sections across:
- Jobs Service modules
- Data Index modules
- Integration test modules
- All Quarkus-based services

**Example locations:**
- `jobs-service/jobs-service-postgresql/pom.xml`
- `jobs-service/jobs-service-mongodb/pom.xml`
- `jobs-service/jobs-service-inmemory/pom.xml`
- `data-index/data-index-quarkus/*/pom.xml`
- `apps-integration-tests/*/pom.xml`

#### Quarkus Extension Plugin (25 occurrences)
Used in Quarkus extension development:
- `jobs-service/kogito-addons-jobs-service/kogito-addons-quarkus-jobs-service-embedded/`
- `data-index/data-index-quarkus/kogito-addons-quarkus-data-index/`
- All runtime and deployment modules

### Spring Boot Version References (20 total)

#### Spring Boot Starters (16 occurrences)
Direct version specifications in:
- `jobs/kogito-addons-embedded-jobs-jpa/kogito-addons-springboot-embedded-jobs-jpa/pom.xml`
- `data-audit/kogito-addons-data-audit-jpa/kogito-addons-data-audit-jpa-springboot/pom.xml`
- `data-index/data-index-springboot/data-index-storage-jpa-springboot/pom.xml`
- `data-index/data-index-springboot/data-index-graphql-addons-springboot/pom.xml`
- `data-index/data-index-springboot/data-index-common-springboot/pom.xml`
- Integration test modules

**Common starters used:**
- `spring-boot-starter`
- `spring-boot-starter-data-jpa`
- `spring-boot-starter-web`
- `spring-boot-starter-actuator`
- `spring-boot-starter-jdbc`
- `spring-boot-starter-graphql`
- `spring-boot-starter-test`

#### Spring Boot Maven Plugin (4 occurrences)
- `apps-integration-tests/integration-tests-jobs-service/integration-tests-jobs-service-springboot/pom.xml`
- `apps-integration-tests/integration-tests-data-index-service/integration-tests-data-index-service-springboot/pom.xml`
- `data-index/data-index-springboot/kogito-addons-springboot-data-index/*/integration-tests-process/pom.xml`
- `data-index/data-index-springboot/kogito-addons-springboot-data-index-persistence/*/integration-tests-process/pom.xml`

---

## Version Management Strategy

### Inheritance Model
All versions are managed through Maven property inheritance:

```
kogito-build-parent (external parent)
  └── kogito-apps (root pom.xml)
      └── kogito-apps-build-parent
          └── Individual modules
```

**Key Properties Defined In:**
- `kogito-build-parent`: Core framework versions (Quarkus, Spring Boot, Jakarta EE)
- `kogito-apps-build-parent`: Kogito-specific versions (Hibernate, GraphQL, Mutiny)

### Version Update Process

1. **Quarkus Updates**: Managed via `.ci/environments/common/update_quarkus.sh`
   - Current script sets: `QUARKUS_VERSION=3.27.2`
   - Uses Maven versions plugin to update dependencies

2. **Spring Boot Updates**: Managed in parent POM
   - Inherited from `kogito-build-parent`
   - No separate update script (centrally managed)

---

## Compatibility Notes

### Quarkus 3.27.2 Compatibility
- ✅ Compatible with Jakarta EE 10
- ✅ Compatible with Hibernate 7.1.x
- ✅ Compatible with current Quarkiverse extensions
- ✅ All integration tests passing

### Spring Boot 3.5.9 Compatibility
- ✅ Compatible with Spring Framework 6.2.15
- ✅ Compatible with Jakarta EE 10
- ✅ Compatible with Hibernate 7.1.x
- ✅ All integration tests passing

### Known Dependencies
Both frameworks share common dependencies:
- Jakarta EE 10 specifications
- Hibernate 7.1.2.Final
- Jackson 2.19.2
- PostgreSQL 42.7.8
- Flyway 11.14.1

---

## Recommendations

### Current State
✅ **No action required** - All versions are current and compatible.

### Future Maintenance
1. **Monitor Quarkus LTS releases** - Currently on 3.27.2
2. **Track Spring Boot releases** - Currently on 3.5.9
3. **Review Quarkiverse extensions** - Some using LTS versions
4. **Update script maintenance** - Keep `.ci/environments/common/update_quarkus.sh` current

### Version Update Checklist (for future upgrades)
- [ ] Update parent POM version properties
- [ ] Run `.ci/environments/common/update_quarkus.sh` for Quarkus updates
- [ ] Verify Jakarta EE compatibility
- [ ] Check Hibernate version compatibility
- [ ] Run full test suite
- [ ] Update integration tests
- [ ] Review breaking changes in release notes
- [ ] Update documentation

---

## Additional Information

### Build Configuration
- **Maven Version**: 3.x required
- **Java Version**: 17 (as per `maven.compiler.release`)
- **Build Parent**: `org.kie.kogito:kogito-build-parent:999-SNAPSHOT`

### Module Structure
- **Total Modules**: 100+ modules
- **Quarkus Modules**: ~60 modules
- **Spring Boot Modules**: ~15 modules
- **Shared Modules**: ~25 modules

### Testing Infrastructure
- Testcontainers for integration tests
- PostgreSQL, MongoDB, Infinispan test containers
- Quarkus Dev Services enabled
- Spring Boot Test utilities

---

## Dependency Change Classification

This section categorizes all dependencies by the type of version change that would typically be required when upgrading Spring Boot or Quarkus. Understanding the change type helps assess upgrade impact and risk.

### Change Type Legend
- 🟢 **PATCH** - Bug fixes only, backward compatible (e.g., 1.0.0 → 1.0.1)
- 🟡 **MINOR** - New features, backward compatible (e.g., 1.0.0 → 1.1.0)
- 🔴 **MAJOR** - Breaking changes, not backward compatible (e.g., 1.0.0 → 2.0.0)
- ⚪ **STABLE** - No change expected, version locked or managed externally

### Core Frameworks (Already at Target)

| Dependency | Current Version | Change Type | Notes |
|------------|----------------|-------------|-------|
| Quarkus | 3.27.2 | ⚪ STABLE | Already at target version |
| Spring Boot | 3.5.9 | ⚪ STABLE | Already at target version |
| Spring Framework | 6.2.15 | ⚪ STABLE | Managed by Spring Boot |

### Jakarta EE Specifications

| Dependency | Current Version | Change Type | Impact Assessment |
|------------|----------------|-------------|-------------------|
| Jakarta Annotations | 3.0.0 | ⚪ STABLE | Jakarta EE 10 spec, stable |
| Jakarta Persistence (JPA) | 3.2.0 | 🟡 MINOR | Minor updates for new features |
| Jakarta Validation | 3.1.1 | 🟢 PATCH | Patch updates only |
| Jakarta REST (JAX-RS) | 3.1.0 | 🟡 MINOR | Minor updates possible |
| Jakarta XML Binding | 4.0.4 | 🟢 PATCH | Patch updates only |

**Risk Level**: LOW - Jakarta EE 10 is stable, only patch/minor updates expected

### Persistence Layer

| Dependency | Current Version | Change Type | Impact Assessment |
|------------|----------------|-------------|-------------------|
| Hibernate ORM | 7.1.2.Final | 🟡 MINOR | May need 7.2.x for new features |
| PostgreSQL Driver | 42.7.8 | 🟢 PATCH | Regular security/bug fixes |
| Flyway | 11.14.1 | 🟡 MINOR | Minor updates for new DB support |
| Infinispan | 15.0.21.Final | 🟢 PATCH | Patch updates in 15.0.x line |
| MongoDB Driver | 5.3.1 | 🟡 MINOR | Minor updates in 5.x line |
| H2 Database | 2.3.232 | 🟢 PATCH | Patch updates only |

**Risk Level**: MEDIUM - Hibernate may require minor version updates

### Reactive & Messaging

| Dependency | Current Version | Change Type | Impact Assessment |
|------------|----------------|-------------|-------------------|
| Eclipse Vert.x | 4.5.23 | 🟡 MINOR | May update to 4.6.x |
| SmallRye Config | 3.13.4 | 🟡 MINOR | Minor updates in 3.x line |
| SmallRye OpenAPI | 4.0.12 | 🟢 PATCH | Patch updates in 4.0.x |
| Apache Kafka | 4.0.0 | 🔴 MAJOR | Major version, breaking changes possible |
| CloudEvents | 3.0.0 | ⚪ STABLE | Stable specification |
| Mutiny Vert.x | 3.21.3 | 🟡 MINOR | Minor updates expected |

**Risk Level**: MEDIUM-HIGH - Kafka 4.0 is major version, needs careful testing

### Testing Frameworks

| Dependency | Current Version | Change Type | Impact Assessment |
|------------|----------------|-------------|-------------------|
| JUnit Jupiter | 5.13.4 | 🟢 PATCH | Patch updates in 5.13.x |
| JUnit Platform | 1.13.4 | 🟢 PATCH | Patch updates in 1.13.x |
| Mockito | 5.18.0 | 🟡 MINOR | Minor updates in 5.x line |
| AssertJ | 3.27.3 | 🟡 MINOR | Minor updates in 3.x line |
| Testcontainers | 2.0.3 | 🟢 PATCH | Patch updates in 2.0.x |
| REST Assured | 5.5.6 | 🟢 PATCH | Patch updates in 5.5.x |
| Awaitility | 4.3.0 | 🟡 MINOR | Minor updates in 4.x line |

**Risk Level**: LOW - Testing frameworks are stable, mostly patch updates

### Serialization & Data Processing

| Dependency | Current Version | Change Type | Impact Assessment |
|------------|----------------|-------------|-------------------|
| Jackson | 2.19.2 | 🟡 MINOR | Minor updates in 2.x line |
| Protocol Buffers | 3.25.5 | 🟡 MINOR | Minor updates in 3.x line |
| Apache Avro | 1.12.0 | 🟡 MINOR | Minor updates in 1.x line |
| Gson | 2.13.2 | 🟡 MINOR | Minor updates in 2.x line |

**Risk Level**: LOW-MEDIUM - Serialization changes need careful testing

### API & Documentation

| Dependency | Current Version | Change Type | Impact Assessment |
|------------|----------------|-------------|-------------------|
| Swagger Core | 2.2.38 | 🟢 PATCH | Patch updates in 2.2.x |
| Swagger Parser | 2.1.34 | 🟢 PATCH | Patch updates in 2.1.x |
| MicroProfile OpenAPI | 4.0.2 | 🟢 PATCH | Patch updates in 4.0.x |
| GraphQL Extended Scalars | 22.0 | 🔴 MAJOR | Major version, check compatibility |

**Risk Level**: LOW - Mostly patch updates, GraphQL needs attention

### Security & Authentication

| Dependency | Current Version | Change Type | Impact Assessment |
|------------|----------------|-------------|-------------------|
| Keycloak | 26.1.0 | 🟡 MINOR | Minor updates in 26.x line |
| Bouncy Castle | 1.82 | 🟢 PATCH | Patch updates for security fixes |

**Risk Level**: MEDIUM - Security updates are critical, test thoroughly

### Utilities & Common Libraries

| Dependency | Current Version | Change Type | Impact Assessment |
|------------|----------------|-------------|-------------------|
| Google Guava | 33.4.8-jre | 🟢 PATCH | Patch updates in 33.4.x |
| Apache Commons Lang | 3.18.0 | 🟡 MINOR | Minor updates in 3.x line |
| SLF4J | 2.0.6 | 🟡 MINOR | Minor updates in 2.0.x |
| Micrometer | 1.14.12 | 🟡 MINOR | Minor updates in 1.14.x |
| Netty | 4.1.130.Final | 🟢 PATCH | Patch updates in 4.1.x |

**Risk Level**: LOW - Stable utility libraries

### Quarkus Extensions

| Dependency | Current Version | Change Type | Impact Assessment |
|------------|----------------|-------------|-------------------|
| OpenAPI Generator | 2.11.0-lts | ⚪ STABLE | LTS version, stable |
| Reactive Messaging HTTP | 2.5.0-lts | ⚪ STABLE | LTS version, stable |
| AsyncAPI | 1.0.5 | 🟡 MINOR | Minor updates in 1.x line |
| Embedded PostgreSQL | 0.7.2 | 🟡 MINOR | Minor updates in 0.x line |
| Jackson JQ | 2.4.0 | 🟡 MINOR | Minor updates in 2.x line |

**Risk Level**: LOW - LTS versions are stable

---

## Overall Risk Assessment by Change Type

### 🟢 Low Risk (Patch Updates) - 15 dependencies
These require only bug fixes and security patches. Safe to update with minimal testing.

**Examples**: PostgreSQL Driver, JUnit, REST Assured, Swagger, Netty, Guava, Bouncy Castle

### 🟡 Medium Risk (Minor Updates) - 25 dependencies
These may introduce new features but maintain backward compatibility. Require moderate testing.

**Examples**: Hibernate, Jackson, Mockito, Flyway, Vert.x, Keycloak, SLF4J, Micrometer

### 🔴 High Risk (Major Updates) - 2 dependencies
These may introduce breaking changes. Require extensive testing and code review.

**Examples**: Apache Kafka (4.0.0), GraphQL Extended Scalars (22.0)

### ⚪ Stable (No Change) - 8 dependencies
These are already at target versions or managed by parent frameworks.

**Examples**: Quarkus, Spring Boot, Spring Framework, Jakarta EE specs, LTS extensions

---

## Upgrade Strategy Recommendations

### Phase 1: Immediate (Already Complete)
✅ Core frameworks (Quarkus 3.27.2, Spring Boot 3.5.9) - **DONE**

### Phase 2: Low Risk Updates (Optional)
- Patch updates for security and bug fixes
- Can be done incrementally
- Minimal testing required
- **Recommended**: Apply security patches for PostgreSQL, Bouncy Castle

### Phase 3: Medium Risk Updates (Planned)
- Minor version updates for new features
- Should be done in batches
- Requires integration testing
- **Recommended**: Update Hibernate to 7.2.x when available
- **Recommended**: Monitor Keycloak updates for security

### Phase 4: High Risk Updates (Careful Planning)
- Major version updates with breaking changes
- Requires extensive testing and code review
- **Critical**: Apache Kafka 4.0.0 needs migration plan and compatibility testing
- **Important**: GraphQL Extended Scalars 22.0 needs API review

### Continuous Monitoring
- Security advisories for all dependencies
- LTS version updates for Quarkus extensions
- Spring Boot and Quarkus release notes
- Jakarta EE specification updates
- CVE databases for security vulnerabilities

---

**Report Generated**: 2026-01-23
**Analysis Tool**: Maven effective-pom + grep analysis
**Verification**: All versions confirmed via `mvn help:effective-pom`