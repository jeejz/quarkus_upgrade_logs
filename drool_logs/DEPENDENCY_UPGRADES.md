# Dependency Upgrades Compared to Upstream Main

This document lists all dependency version upgrades made in this fork compared to the upstream apache/incubator-kie-drools main branch.

## Summary

Total dependencies upgraded: 27

| Dependency | Old Version (Upstream) | New Version (Fork) | Change Type |
|------------|------------------------|-------------------|-------------|
| commons-codec | 1.18.0 | 1.19.0 | Minor |
| commons-io | 2.19.0 | 2.20.0 | Minor |
| common-text | 1.11.0 | 1.14.0 | Minor |
| com.fasterxml.jackson | 2.18.4 | 2.19.2 | Minor |
| com.fasterxml.jackson.databind | 2.18.4 | 2.19.2 | Minor |
| com.fasterxml.jackson.annotations | 2.18.4 | 2.19.2 | Minor |
| info.picocli | 4.7.5 | 4.7.7 | Patch |
| io.quarkus | 3.20.3 | 3.27.2 | Minor |
| io.netty | 4.1.128.Final | 4.1.130.Final | Patch |
| io.smallrye.config.core | 3.11.4 | 3.13.4 | Minor |
| org.apache.kafka | 3.9.1 | 4.0.0 | Major |
| org.jboss.narayana.tomcat | 7.0.2.Final | 7.2.2.Final | Minor |
| jakarta.enterprise.cdi-api | 4.0.1 | 4.1.0 | Minor |
| jakarta.annotation-api | 2.1.1 | 3.0.0 | Major |
| jakarta.persistence-api | 3.1.0 | 3.2.0 | Minor |
| jakarta.json.bind-api | 3.0.0 | 3.0.1 | Patch |
| jakarta.json | 1.1.5 | 1.1.7 | Patch |
| org.junit.jupiter | 5.12.2 | 5.13.4 | Minor |
| org.junit.platform | 1.12.2 | 1.13.4 | Minor |
| plugin.annotations | 3.7.1 | 3.15.1 | Minor |
| shared.utils | 3.3.4 | 3.4.2 | Minor |
| common.compress | 1.27.1 | 1.28.0 | Minor |
| net.byte-buddy | 1.14.11 | 1.17.6 | Minor |
| org.postgresql | 42.7.8 | 42.7.7 | Patch (Downgrade) |
| io.smallrye.jandex | 3.3.0 | 3.4.0 | Minor |
| org.eclipse.yasson | 3.0.3 | 3.0.4 | Patch |
| com.github.javaparser | 3.26.4 | 3.27.0 | Minor |
| com.google.guava | 32.0.1-jre | 33.4.8-jre | Major |
| org.awaitility | 4.2.0 | 4.3.0 | Minor |
| io.vertx | 4.5.22 | 4.5.23 | Patch |

## Change Type Breakdown

- **Major upgrades**: 3
  - org.apache.kafka: 3.9.1 → 4.0.0
  - jakarta.annotation-api: 2.1.1 → 3.0.0
  - com.google.guava: 32.0.1-jre → 33.4.8-jre

- **Minor upgrades**: 19
  - commons-codec: 1.18.0 → 1.19.0
  - commons-io: 2.19.0 → 2.20.0
  - common-text: 1.11.0 → 1.14.0
  - com.fasterxml.jackson (all): 2.18.4 → 2.19.2
  - io.quarkus: 3.20.3 → 3.27.2
  - io.smallrye.config.core: 3.11.4 → 3.13.4
  - org.jboss.narayana.tomcat: 7.0.2.Final → 7.2.2.Final
  - jakarta.enterprise.cdi-api: 4.0.1 → 4.1.0
  - jakarta.persistence-api: 3.1.0 → 3.2.0
  - org.junit.jupiter: 5.12.2 → 5.13.4
  - org.junit.platform: 1.12.2 → 1.13.4
  - plugin.annotations: 3.7.1 → 3.15.1
  - shared.utils: 3.3.4 → 3.4.2
  - common.compress: 1.27.1 → 1.28.0
  - net.byte-buddy: 1.14.11 → 1.17.6
  - io.smallrye.jandex: 3.3.0 → 3.4.0
  - com.github.javaparser: 3.26.4 → 3.27.0
  - org.awaitility: 4.2.0 → 4.3.0

- **Patch upgrades**: 5
  - info.picocli: 4.7.5 → 4.7.7
  - io.netty: 4.1.128.Final → 4.1.130.Final
  - jakarta.json.bind-api: 3.0.0 → 3.0.1
  - jakarta.json: 1.1.5 → 1.1.7
  - org.eclipse.yasson: 3.0.3 → 3.0.4
  - io.vertx: 4.5.22 → 4.5.23

- **Downgrades**: 1
  - org.postgresql: 42.7.8 → 42.7.7 (Patch downgrade)

## Notable Upgrades

### Quarkus Framework
- **io.quarkus**: 3.20.3 → 3.27.2 (Minor upgrade spanning 7 minor versions)
  - This is a significant upgrade that brings many improvements and bug fixes

### Apache Kafka
- **org.apache.kafka**: 3.9.1 → 4.0.0 (Major upgrade)
  - Breaking changes may be present, requires careful testing

### Jakarta EE APIs
- **jakarta.annotation-api**: 2.1.1 → 3.0.0 (Major upgrade)
- **jakarta.enterprise.cdi-api**: 4.0.1 → 4.1.0 (Minor upgrade)
- **jakarta.persistence-api**: 3.1.0 → 3.2.0 (Minor upgrade)

### Google Guava
- **com.google.guava**: 32.0.1-jre → 33.4.8-jre (Major upgrade)
  - Significant version jump with potential API changes

### Testing Frameworks
- **org.junit.jupiter**: 5.12.2 → 5.13.4 (Minor upgrade)
- **org.junit.platform**: 1.12.2 → 1.13.4 (Minor upgrade)

### Jackson JSON Library
- All Jackson components upgraded from 2.18.4 → 2.19.2 (Minor upgrade)
  - Consistent upgrade across jackson, jackson.databind, and jackson.annotations

---

*Generated on: 2026-01-23*
*Comparison: apache/main vs current HEAD*