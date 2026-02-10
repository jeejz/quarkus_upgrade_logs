# Quarkus 3.27.1 Update - Dependency Changes

## Summary
This document lists all dependency version changes resulting from the Quarkus update from 3.20.3 to 3.27.1.

## Upgraded Dependencies

| Dependency | Old Version | New Version | Change |
|------------|-------------|-------------|--------|
| commons-codec | 1.18.0 | 1.19.0 | +0.1.0 |
| commons-io | 2.19.0 | 2.20.0 | +0.1.0 |
| common-text | 1.11.0 | 1.14.0 | +0.3.0 |
| com.fasterxml.jackson | 2.18.4 | 2.19.2 | +0.0.8 |
| com.fasterxml.jackson.databind | 2.18.4 | 2.19.2 | +0.0.8 |
| com.fasterxml.jackson.annotations | 2.18.4 | 2.19.2 | +0.0.8 |
| info.picocli | 4.7.5 | 4.7.7 | +0.0.2 |
| io.quarkus | 3.20.3 | 3.27.1 | +0.6.8 |
| io.smallrye.config.core | 3.11.4 | 3.13.4 | +0.2.0 |
| org.apache.kafka | 3.9.1 | 4.0.0 | +0.0.9 |
| org.jboss.narayana.tomcat | 7.0.2.Final | 7.2.2.Final | +0.2.0 |
| jakarta.enterprise.cdi-api | 4.0.1 | 4.1.0 | +0.0.9 |
| jakarta.annotation-api | 2.1.1 | 3.0.0 | +0.8.9 |
| jakarta.persistence-api | 3.1.0 | 3.2.0 | +0.1.0 |
| jakarta.json.bind-api | 3.0.0 | 3.0.1 | +0.0.1 |
| jakarta.json | 1.1.5 | 1.1.7 | +0.0.2 |
| org.junit.jupiter | 5.12.2 | 5.13.4 | +0.1.2 |
| org.junit.platform | 1.12.2 | 1.13.4 | +0.1.2 |
| plugin.annotations | 3.7.1 | 3.13.1 | +0.6.0 |
| shared.utils | 3.3.4 | 3.4.2 | +0.0.8 |
| common.compress | 1.27.1 | 1.28.0 | +0.0.9 |
| net.byte-buddy | 1.14.11 | 1.17.6 | +0.2.5 |
| org.eclipse.yasson | 3.0.3 | 3.0.4 | +0.0.1 |
| com.github.javaparser | 3.26.4 | 3.27.0 | +0.0.6 |
| com.google.guava | 32.0.1-jre | 33.4.8-jre | +1.4.7 |
| org.awaitility | 4.2.0 | 4.3.0 | +0.1.0 |

## Downgraded Dependencies

| Dependency | Old Version | New Version | Change |
|------------|-------------|-------------|--------|
| com.h2database | 2.3.232 | 2.3.230 | -0.0.2 |
| io.micrometer | 1.14.12 | 1.14.7 | -0.0.5 |
| jakarta.activation | 2.0.3 | 2.0.2 | -0.0.1 |
| jakarta.activation-api | 2.1.4 | 2.1.3 | -0.0.1 |
| jakarta.xml.bind-api | 4.0.4 | 4.0.2 | -0.0.2 |
| org.postgresql | 42.7.8 | 42.7.7 | -0.0.1 |
| org.lz4.java | 1.8.1 | 1.8.0 | -0.0.1 |

## Action Required

The following dependencies were downgraded and should be reviewed to determine if they need to be reset to their previous versions:

1. **com.h2database**: 2.3.232 → 2.3.230 (downgrade by 2 patch versions)
2. **io.micrometer**: 1.14.12 → 1.14.7 (downgrade by 5 patch versions)
3. **jakarta.activation**: 2.0.3 → 2.0.2 (downgrade by 1 patch version)
4. **jakarta.activation-api**: 2.1.4 → 2.1.3 (downgrade by 1 patch version)
5. **jakarta.xml.bind-api**: 4.0.4 → 4.0.2 (downgrade by 2 patch versions)
6. **org.postgresql**: 42.7.8 → 42.7.7 (downgrade by 1 patch version)
7. **org.lz4.java**: 1.8.1 → 1.8.0 (downgrade by 1 patch version)

## Notes

- Most upgrades are minor or patch version increases
- Major version upgrades: jakarta.annotation-api (2.1.1 → 3.0.0), org.apache.kafka (3.9.1 → 4.0.0), com.google.guava (32.0.1 → 33.4.8)
- The downgrades are likely due to Quarkus BOM dependency management constraints
- Review each downgraded dependency to ensure compatibility and security requirements are met