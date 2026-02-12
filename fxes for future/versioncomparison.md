# Cross-Repository Dependency Version Comparison

## Quick Glance

- **Total unique version properties across all repos:** 255
- **Shared properties (appear in 2+ repos):** 53
- **Version mismatches:** 10
- **Version matches:** 43

### Version Mismatches (need syncing)

| Dependency | 1drools | 2optaplanner | 3runtimes | 4apps | 5examples |
|---|---|---|---|---|---|
| `version.org.slf4j` | 2.0.17 | 2.0.17 | **2.0.6** | - | - |
| `version.com.github.javaparser` | 3.27.0 | - | **3.26.4** | - | - |
| `version.com.squareup.okhttp3` | **4.9.2** | - | 4.12.0 | - | - |
| `version.org.skyscreamer` | - | - | - | 1.5.1 | **1.5.0** |
| `version.formatter.plugin` | - | 2.29.0 | **2.13.0** | - | - |
| `version.impsort.plugin` | - | 1.13.0 | **1.8.0** | - | - |
| `version.asciidoctor.plugin` | - | 2.2.3 | **1.5.2.1** | - | - |
| `version.plugin.plugin` | 3.6.4 | - | **3.10.2** | - | - |
| `version.shade.plugin` | 3.3.0 | - | **3.0.0** | - | - |
| `version.versions.plugin` | - | 2.21.0 | **2.5** | - | - |

### Key Observations

1. **`version.org.slf4j`** - Most critical. 3runtimes is at `2.0.6` while drools and optaplanner are at `2.0.17`. This is a fundamental logging dependency and should be synced.
2. **`version.com.github.javaparser`** - 1drools is at `3.27.0`, 3runtimes at `3.26.4`. Since runtimes consumes drools, this could cause issues.
3. **`version.com.squareup.okhttp3`** - 1drools is behind at `4.9.2`, 3runtimes is at `4.12.0`. Drools should be bumped.
4. **`version.org.skyscreamer`** (JSONassert) - 4apps at `1.5.1`, 5examples at `1.5.0`. Minor but should be aligned.
5. **Plugin version mismatches** (formatter, impsort, asciidoctor, shade, versions, plugin) - 3runtimes generally has older plugin versions compared to 1drools and 2optaplanner.

### Shared Dependencies In Sync (43 total)

Key ones include: Quarkus (`3.27.2`), Netty (`4.1.130.Final`), Jackson (`2.19.2`), JUnit Jupiter (`5.13.4`), Mockito (`5.18.0`), Infinispan (`15.0.21.Final`), Spring Boot (`3.5.10`), Logback (`1.5.25`), assertj (`3.27.7`).

---

## Repositories Analyzed

| Repo | Root POM | Build Parent / BOM | Properties Count |
|------|----------|-------------------|-----------------|
| 1drools | /home/jijo/coding/ibm/apachekie/1drools/pom.xml, /home/jijo/coding/ibm/apachekie/1drools/build-parent/pom.xml | 116 props |
| 2optaplanner | /home/jijo/coding/ibm/apachekie/2optaplanner/pom.xml, /home/jijo/coding/ibm/apachekie/2optaplanner/build/optaplanner-build-parent/pom.xml | 36 props |
| 3runtimes | /home/jijo/coding/ibm/apachekie/3runtimes/pom.xml, /home/jijo/coding/ibm/apachekie/3runtimes/kogito-build/kogito-build-no-bom-parent/pom.xml, /home/jijo/coding/ibm/apachekie/3runtimes/kogito-build/kogito-dependencies-bom/pom.xml | 143 props |
| 4apps | /home/jijo/coding/ibm/apachekie/4apps/pom.xml, /home/jijo/coding/ibm/apachekie/4apps/kogito-apps-build-parent/pom.xml | 16 props |
| 5examples | /home/jijo/coding/ibm/apachekie/5examples/pom.xml | 6 props |

## Shared Dependency Versions (sorted: mismatches first)

| Dependency Property Name | 1drools | 2optaplanner | 3runtimes | 4apps | 5examples | Mismatch |
|---|---|---|---|---|---|---|
| version.asciidoctor.plugin | - | 2.2.3 | 1.5.2.1 | - | - | YES |
| version.com.github.javaparser | 3.27.0 | - | 3.26.4 | - | - | YES |
| version.com.squareup.okhttp3 | 4.9.2 | - | 4.12.0 | - | - | YES |
| version.formatter.plugin | - | 2.29.0 | 2.13.0 | - | - | YES |
| version.impsort.plugin | - | 1.13.0 | 1.8.0 | - | - | YES |
| version.org.skyscreamer | - | - | - | 1.5.1 | 1.5.0 | YES |
| version.org.slf4j | 2.0.17 | 2.0.17 | 2.0.6 | - | - | YES |
| version.plugin.plugin | 3.6.4 | - | 3.10.2 | - | - | YES |
| version.shade.plugin | 3.3.0 | - | 3.0.0 | - | - | YES |
| version.versions.plugin | - | 2.21.0 | 2.5 | - | - | YES |
| version.at.yawk.lz4.java | 1.10.1 | - | 1.10.1 | - | - | NO |
| version.ch.qos.logback | 1.5.25 | 1.5.25 | 1.5.25 | - | - | NO |
| version.com.fasterxml.jackson | 2.19.2 | - | 2.19.2 | - | - | NO |
| version.com.fasterxml.jackson.databind | 2.19.2 | - | 2.19.2 | - | - | NO |
| version.com.github.victools | 4.37.0 | - | 4.37.0 | - | - | NO |
| version.com.google.guava | 33.4.8-jre | - | 33.4.8-jre | - | - | NO |
| version.com.google.protobuf | 3.25.5 | - | 3.25.5 | - | - | NO |
| version.com.thoughtworks.xstream | 1.4.21 | 1.4.21 | - | - | - | NO |
| version.compiler.plugin | 3.13.0 | 3.13.0 | 3.13.0 | - | - | NO |
| version.dependency.plugin | - | 3.5.0 | 3.5.0 | - | - | NO |
| version.io.micrometer | 1.14.12 | - | 1.14.12 | - | - | NO |
| version.io.netty | 4.1.130.Final | 4.1.130.Final | 4.1.130.Final | - | - | NO |
| version.io.quarkus | 3.27.2 | 3.27.2 | 3.27.2 | - | - | NO |
| version.io.swagger.core.v3 | 2.2.38 | - | 2.2.38 | - | - | NO |
| version.io.swagger.parser.v3 | 2.1.34 | - | 2.1.34 | - | - | NO |
| version.io.vertx | 4.5.23 | - | 4.5.23 | - | - | NO |
| version.jacoco.plugin | 0.8.11 | 0.8.11 | 0.8.11 | - | - | NO |
| version.jakarta.annotation-api | 3.0.0 | - | 3.0.0 | - | - | NO |
| version.jakarta.persistence-api | 3.2.0 | - | 3.2.0 | - | - | NO |
| version.jakarta.xml.bind-api | 4.0.4 | - | 4.0.4 | - | - | NO |
| version.maven-checkstyle | 3.3.0 | - | 3.3.0 | - | - | NO |
| version.maven-javadoc-plugin.override | 3.6.2 | 3.6.2 | - | - | - | NO |
| version.maven.artifact.plugin | 3.4.1 | 3.4.1 | 3.4.1 | - | 3.4.1 | NO |
| version.net.byte-buddy | 1.17.6 | - | 1.17.6 | - | - | NO |
| version.org.apache.commons.math3 | 3.6.1 | 3.6.1 | - | - | - | NO |
| version.org.apache.kafka | 4.0.0 | - | 4.0.0 | - | - | NO |
| version.org.apache.openjpa | 4.0.0 | 4.0.0 | - | - | - | NO |
| version.org.apache.poi | 5.4.1 | 5.4.1 | - | - | - | NO |
| version.org.assertj | 3.27.7 | 3.27.7 | 3.27.7 | - | - | NO |
| version.org.awaitility | 4.3.0 | - | 4.3.0 | - | - | NO |
| version.org.freemarker | 2.3.34 | 2.3.34 | - | - | - | NO |
| version.org.glassfish.jaxb | 4.0.6 | - | 4.0.6 | - | - | NO |
| version.org.hamcrest | 2.2 | - | 2.2 | - | - | NO |
| version.org.infinispan | 15.0.21.Final | - | 15.0.21.Final | - | - | NO |
| version.org.infinispan.protostream | 5.0.13.Final | - | 5.0.13.Final | - | - | NO |
| version.org.junit.jupiter | 5.13.4 | - | 5.13.4 | - | - | NO |
| version.org.junit.platform | 1.13.4 | - | 1.13.4 | - | - | NO |
| version.org.mockito | 5.18.0 | - | 5.18.0 | - | - | NO |
| version.org.mvel | 2.5.2.Final | - | 2.5.2.Final | - | - | NO |
| version.org.postgresql | 42.7.8 | - | 42.7.8 | - | - | NO |
| version.org.springframework | - | 6.2.15 | 6.2.15 | - | - | NO |
| version.org.springframework.boot | - | 3.5.10 | 3.5.10 | - | - | NO |
| version.surefire.plugin | - | 3.3.1 | 3.3.1 | - | - | NO |

## Mismatch Details

### `version.asciidoctor.plugin`

- **2optaplanner**: `2.2.3`
- **3runtimes**: `1.5.2.1`

### `version.com.github.javaparser`

- **1drools**: `3.27.0`
- **3runtimes**: `3.26.4`

### `version.com.squareup.okhttp3`

- **1drools**: `4.9.2`
- **3runtimes**: `4.12.0`

### `version.formatter.plugin`

- **2optaplanner**: `2.29.0`
- **3runtimes**: `2.13.0`

### `version.impsort.plugin`

- **2optaplanner**: `1.13.0`
- **3runtimes**: `1.8.0`

### `version.org.skyscreamer`

- **4apps**: `1.5.1`
- **5examples**: `1.5.0`

### `version.org.slf4j`

- **1drools**: `2.0.17`
- **2optaplanner**: `2.0.17`
- **3runtimes**: `2.0.6`

### `version.plugin.plugin`

- **1drools**: `3.6.4`
- **3runtimes**: `3.10.2`

### `version.shade.plugin`

- **1drools**: `3.3.0`
- **3runtimes**: `3.0.0`

### `version.versions.plugin`

- **2optaplanner**: `2.21.0`
- **3runtimes**: `2.5`

## All Properties Per Repository (for reference)

### 1drools (116 version properties)

| Property | Value |
|---|---|
| version.antlr | 2.7.7 |
| version.archunit.junit5 | 1.2.0 |
| version.archunit.maven.plugin | 2.9.1 |
| version.artifact.transfer | 0.9.1 |
| version.at.yawk.lz4.java | 1.10.1 |
| version.build.helper.maven.plugin | 3.4.0 |
| version.ch.obermuhlner | 2.0.1 |
| version.ch.qos.logback | 1.5.25 |
| version.com.fasterxml.jackson | 2.19.2 |
| version.com.fasterxml.jackson.annotations | 2.19.2 |
| version.com.fasterxml.jackson.databind | 2.19.2 |
| version.com.github.eirslett | 1.15.1 |
| version.com.github.javaparser | 3.27.0 |
| version.com.github.spotbugs-maven-plugin | 3.1.8 |
| version.com.github.victools | 4.37.0 |
| version.com.google.guava | 33.4.8-jre |
| version.com.google.protobuf | 3.25.5 |
| version.com.h2database | 2.3.232 |
| version.com.miglayout | 3.7.4 |
| version.com.networknt.json-schema-validator | 1.0.86 |
| version.com.squareup.okhttp3 | 4.9.2 |
| version.com.sun.xml.bind | 4.0.5 |
| version.com.thoughtworks.xstream | 1.4.21 |
| version.common-text | 1.14.0 |
| version.common.compress | 1.28.0 |
| version.common.exec | 1.3 |
| version.commons-codec | 1.19.0 |
| version.commons-collections | 3.2.2 |
| version.commons-io | 2.20.0 |
| version.commons-logging | 1.1.1 |
| version.compiler.plugin | 3.13.0 |
| version.domino-slf4j-logger | 1.0.1 |
| version.download-maven-plugin | 2.0.0 |
| version.guru.nidi | 0.18.0 |
| version.info.picocli | 4.7.7 |
| version.io.micrometer | 1.14.12 |
| version.io.netty | 4.1.130.Final |
| version.io.quarkus | 3.27.2 |
| version.io.smallrye.config.core | 3.13.4 |
| version.io.smallrye.jandex | 3.4.0 |
| version.io.smallrye.openapi.core | 4.0.12 |
| version.io.swagger.core.v3 | 2.2.38 |
| version.io.swagger.parser.v3 | 2.1.34 |
| version.io.vertx | 4.5.23 |
| version.it.unimi.dsi.fastutil | 8.5.11 |
| version.jacoco.plugin | 0.8.11 |
| version.jakarta.activation | 2.0.3 |
| version.jakarta.activation-api | 2.1.4 |
| version.jakarta.annotation-api | 3.0.0 |
| version.jakarta.enterprise.cdi-api | 4.1.0 |
| version.jakarta.inject-api | 2.0.1 |
| version.jakarta.json | 1.1.7 |
| version.jakarta.json-api | 2.1.3 |
| version.jakarta.json.bind-api | 3.0.1 |
| version.jakarta.persistence-api | 3.2.0 |
| version.jakarta.transaction-api | 2.0.1 |
| version.jakarta.xml.bind-api | 4.0.4 |
| version.junit | 4.13.2 |
| version.maven-checkstyle | 3.3.0 |
| version.maven-javadoc-plugin.override | 3.6.2 |
| version.maven.artifact.plugin | 3.4.1 |
| version.maven.min | 3.8.1 |
| version.net.byte-buddy | 1.17.6 |
| version.net.java.dev.glazedlists | 1.8.0 |
| version.org.antlr | 3.5.2 |
| version.org.antlr.ST4 | 4.0.7 |
| version.org.antlr4 | 4.13.2 |
| version.org.apache.ant | 1.10.11 |
| version.org.apache.commons.lang3 | 3.18.0 |
| version.org.apache.commons.math3 | 3.6.1 |
| version.org.apache.httpcomponents.httpcore | 4.4.16 |
| version.org.apache.kafka | 4.0.0 |
| version.org.apache.maven | 3.9.11 |
| version.org.apache.maven.resolver | 1.7.3 |
| version.org.apache.maven.wagon | 3.5.3 |
| version.org.apache.openjpa | 4.0.0 |
| version.org.apache.pdfbox | 2.0.28 |
| version.org.apache.poi | 5.4.1 |
| version.org.apache.tomcat.tomcat-dbcp | 10.1.48 |
| version.org.asciidoctor.asciidoctorj | 2.2.0 |
| version.org.asciidoctor.asciidoctorj-pdf | 1.5.0 |
| version.org.assertj | 3.27.7 |
| version.org.awaitility | 4.3.0 |
| version.org.eclipse.jdt | 3.44.0 |
| version.org.eclipse.microprofile.config | 3.1 |
| version.org.eclipse.yasson | 3.0.4 |
| version.org.freemarker | 2.3.34 |
| version.org.glassfish.jaxb | 4.0.6 |
| version.org.hamcrest | 2.2 |
| version.org.hsqldb | 2.3.0 |
| version.org.infinispan | 15.0.21.Final |
| version.org.infinispan.protostream | 5.0.13.Final |
| version.org.javassist | 3.26.0-GA |
| version.org.jboss.arquillian.selenium | 3.13.0 |
| version.org.jboss.logging | 3.6.1.Final |
| version.org.jboss.narayana.tomcat | 7.2.2.Final |
| version.org.jboss.transaction.spi | 8.0.0.Final |
| version.org.jboss.weld.weld | 3.1.6.Final |
| version.org.jpmml.model | 1.6.4 |
| version.org.junit.jupiter | 5.13.4 |
| version.org.junit.platform | 1.13.4 |
| version.org.mockito | 5.18.0 |
| version.org.mvel | 2.5.2.Final |
| version.org.openjdk.jmh | 1.21 |
| version.org.postgresql | 42.7.8 |
| version.org.powermock | 2.0.9 |
| version.org.slf4j | 2.0.17 |
| version.org.w3c.dom | 2.3.0-jaxb-1.0.6 |
| version.org.xmlunit | 2.10.4 |
| version.plugin.annotations | 3.15.1 |
| version.plugin.plugin | 3.6.4 |
| version.property-maven-plugin | 1.2.1 |
| version.shade.plugin | 3.3.0 |
| version.shared.utils | 3.4.2 |
| version.simple-jndi | 0.11.4.1 |
| version.xerces | 2.12.0.SP04 |

### 2optaplanner (36 version properties)

| Property | Value |
|---|---|
| maven.min.version | 3.8.1 |
| version.asciidoctor.plugin | 2.2.3 |
| version.assembly.plugin | 3.4.2 |
| version.ch.qos.logback | 1.5.25 |
| version.com.thoughtworks.xstream | 1.4.21 |
| version.compiler.plugin | 3.13.0 |
| version.dependency.plugin | 3.5.0 |
| version.formatter.plugin | 2.29.0 |
| version.impsort.plugin | 1.13.0 |
| version.io.netty | 4.1.130.Final |
| version.io.quarkiverse.operatorsdk | 6.6.7 |
| version.io.quarkus | 3.27.2 |
| version.jacoco.plugin | 0.8.11 |
| version.jaxb2.plugin | 3.1.0 |
| version.maven-exec-plugin | 3.1.0 |
| version.maven-javadoc-plugin.override | 3.6.2 |
| version.maven.artifact.plugin | 3.4.1 |
| version.org.apache.commons.math3 | 3.6.1 |
| version.org.apache.commons.text | 1.14.0 |
| version.org.apache.logging.log4j | 2.22.1 |
| version.org.apache.openjpa | 4.0.0 |
| version.org.apache.poi | 5.4.1 |
| version.org.assertj | 3.27.7 |
| version.org.freemarker | 2.3.34 |
| version.org.jdom2 | 2.0.6.1 |
| version.org.jfree.jfreechart | 1.5.4 |
| version.org.openrewrite.recipe | 1.19.3 |
| version.org.slf4j | 2.0.17 |
| version.org.springframework | 6.2.15 |
| version.org.springframework.boot | 3.5.10 |
| version.pitest.plugin | 1.14.4 |
| version.revapi.plugin | 0.15.0 |
| version.rewrite.plugin | 4.45.0 |
| version.sniffer.plugin | 1.23 |
| version.surefire.plugin | 3.3.1 |
| version.versions.plugin | 2.21.0 |

### 3runtimes (143 version properties)

| Property | Value |
|---|---|
| version.angus.mail | 2.0.5 |
| version.antapacheregexp | 1.8.2 |
| version.antrun.plugin | 1.8 |
| version.apache.commons.commons-compress | 1.28.0 |
| version.archetype.plugin | 3.4.0 |
| version.asciidoctor.plugin | 1.5.2.1 |
| version.at.yawk.lz4.java | 1.10.1 |
| version.black.ninia | 4.2.0 |
| version.build.helper.plugin | 3.0.0 |
| version.ch.qos.logback | 1.5.25 |
| version.clean.plugin | 3.1.0 |
| version.com.fasterxml.jackson | 2.19.2 |
| version.com.fasterxml.jackson.databind | 2.19.2 |
| version.com.fasterxml.jackson.datatype | 2.19.2 |
| version.com.github.haifengl.smile | 1.5.2 |
| version.com.github.javaparser | 3.26.4 |
| version.com.github.stephenc.jcip | 1.0-1 |
| version.com.github.victools | 4.37.0 |
| version.com.google.collections | 1.0 |
| version.com.google.gson | 2.13.2 |
| version.com.google.guava | 33.4.8-jre |
| version.com.google.protobuf | 3.25.5 |
| version.com.h2 | 2.3.232 |
| version.com.jayway.jsonpath | 2.9.0 |
| version.com.networknt | 1.0.86 |
| version.com.ongres.scram | 3.2 |
| version.com.societegenerale.commons | 4.0.2 |
| version.com.squareup.okhttp3 | 4.12.0 |
| version.com.sun.activation | 2.0.2 |
| version.com.sun.xml.bind.core | 4.0.5 |
| version.commons.io | 2.20.0 |
| version.compiler.plugin | 3.13.0 |
| version.copyrename.plugin | 1.0 |
| version.de.skuzzle.enforcer | 1.1.0 |
| version.dependency.plugin | 3.5.0 |
| version.enforcer.plugin | 3.3.0 |
| version.exec.plugin | 3.1.1 |
| version.findbugs.plugin | 3.0.5 |
| version.formatter.plugin | 2.13.0 |
| version.impsort.plugin | 1.8.0 |
| version.install.plugin | 3.1.1 |
| version.invoker.plugin | 3.7.0 |
| version.io.cloudevents | 3.0.0 |
| version.io.fabric8.kubernetes-client | 7.3.1 |
| version.io.github.download-maven-plugin | 2.0.0 |
| version.io.grpc | 1.76.0 |
| version.io.micrometer | 1.14.12 |
| version.io.netty | 4.1.130.Final |
| version.io.quarkiverse.asyncapi | 1.0.5 |
| version.io.quarkiverse.embedded.postgresql | 0.7.2 |
| version.io.quarkiverse.jackson-jq | 2.4.0 |
| version.io.quarkiverse.openapi.generator | 2.11.0-lts |
| version.io.quarkiverse.reactivemessaging.http | 2.5.0-lts |
| version.io.quarkus | 3.27.2 |
| version.io.quarkus.camel | 3.27.2 |
| version.io.rest-assured | 5.5.6 |
| version.io.serverlessworkflow | 4.1.0.Final |
| version.io.smallrye-config | 3.13.4 |
| version.io.smallrye-open-api | 4.0.12 |
| version.io.smallrye.reactive.mutiny-vertx-web-client | 3.21.3 |
| version.io.swagger.core.v3 | 2.2.38 |
| version.io.swagger.parser.v3 | 2.1.34 |
| version.io.vertx | 4.5.23 |
| version.jacoco.plugin | 0.8.11 |
| version.jakarta.annotation-api | 3.0.0 |
| version.jakarta.persistence-api | 3.2.0 |
| version.jakarta.validation-api | 3.1.1 |
| version.jakarta.ws.rs | 3.1.0 |
| version.jakarta.xml.bind-api | 4.0.4 |
| version.jandex.plugin | 3.2.3 |
| version.jar.plugin | 3.2.0 |
| version.javancss.plugin | 2.0 |
| version.javax.inject | 2.0.1 |
| version.jdocbook.plugin | 2.3.9 |
| version.kr.motd.maven.os | 1.6.0 |
| version.license.plugin | 4.0.rc2 |
| version.maven | 3.9.11 |
| version.maven-checkstyle | 3.3.0 |
| version.maven-javadoc-plugin | 3.6.2 |
| version.maven.artifact.plugin | 3.4.1 |
| version.maven.invoker | 3.2.0 |
| version.maven.plugin | 3.15.1 |
| version.maven.plugin.testing.harness | 4.0.0-alpha-2 |
| version.maven.project | 2.2.1 |
| version.native2ascii.plugin | 1.0-beta-1 |
| version.net.byte-buddy | 1.17.6 |
| version.net.minidev.jsonsmart | 2.4.10 |
| version.net.thisptr.jackson-jq | 1.0.0-preview.20240207 |
| version.org.apache.avro | 1.12.0 |
| version.org.apache.commons | 3.18.0 |
| version.org.apache.kafka | 4.0.0 |
| version.org.assertj | 3.27.7 |
| version.org.awaitility | 4.3.0 |
| version.org.bouncycastle.bc.jdk18on | 1.82 |
| version.org.codehaus.gmavenplus.plugin | 1.5 |
| version.org.eclipse.microprofile.openapi | 4.0.2 |
| version.org.flywaydb | 11.14.1 |
| version.org.glassfish.jaxb | 4.0.6 |
| version.org.graalvm.nativeimage | 23.1.2 |
| version.org.hamcrest | 2.2 |
| version.org.infinispan | 15.0.21.Final |
| version.org.infinispan.protostream | 5.0.13.Final |
| version.org.jboss.resteasy | 6.2.12.Final |
| version.org.json-unit-assertj | 2.9.0 |
| version.org.jsonschema2pojo-maven-plugin | 1.0.1 |
| version.org.junit | 4.13.2 |
| version.org.junit.jupiter | 5.13.4 |
| version.org.junit.platform | 1.13.4 |
| version.org.keycloak | 26.1.0 |
| version.org.mockito | 5.18.0 |
| version.org.mongo | 5.3.1 |
| version.org.mongo-image | 5.0.31 |
| version.org.mozilla.rhino | 1.8.1 |
| version.org.mvel | 2.5.2.Final |
| version.org.postgres | 16.8-alpine3.21 |
| version.org.postgresql | 42.7.8 |
| version.org.reactivestreams | 1.0.4 |
| version.org.redis | 2.0.4 |
| version.org.reflections | 0.10.2 |
| version.org.rocksdb | 7.10.2 |
| version.org.slf4j | 2.0.6 |
| version.org.springframework | 6.2.15 |
| version.org.springframework.boot | 3.5.10 |
| version.org.testcontainers | 2.0.3 |
| version.org.wiremock | 3.13.0 |
| version.org.xmlunit-core | 2.10.4 |
| version.org.xolstice.maven.protobuf | 0.6.1 |
| version.plexus | 2.1.0 |
| version.plexus.classworld | 2.6.0 |
| version.plugin.plugin | 3.10.2 |
| version.project.sources.plugin | 0.3 |
| version.resources.plugin | 3.1.0 |
| version.rpkgtests.maven.plugin | 1.0.0 |
| version.shade.plugin | 3.0.0 |
| version.site.plugin | 3.7.1 |
| version.sonar.plugin | 3.6.1.1688 |
| version.source.plugin | 3.2.1 |
| version.surefire.plugin | 3.3.1 |
| version.surefire.report.plugin | 3.1.2 |
| version.taglist.plugin | 2.4 |
| version.tomcat.embed.core | 10.1.48 |
| version.versions.plugin | 2.5 |
| version.wurstmeister.kafka | 2.12-2.2.1 |

### 4apps (16 version properties)

| Property | Value |
|---|---|
| version.com.graphql-java | 24.3 |
| version.com.graphql-java-extended-scalars | 24.0 |
| version.explainability-core | 1.22.1.Final |
| version.frontend.plugin | 1.12.1 |
| version.io.smallrye.reactive.mutiny-zero | 1.1.1 |
| version.node | v18.16.0 |
| version.npm | 6.10.3 |
| version.org.apache.commons.csv | 1.10.0 |
| version.org.apache.opennlp | 2.3.2 |
| version.org.hibernate | 7.1.14.Final |
| version.org.jredisearch | 2.2.0 |
| version.org.json | 20231013 |
| version.org.mapstruct | 1.5.5.Final |
| version.org.skyscreamer | 1.5.1 |
| version.pnpm | v8.7.0 |
| version.rename.plugin | 1.0.1 |

### 5examples (6 version properties)

| Property | Value |
|---|---|
| version.jib.plugin | 3.3.1 |
| version.maven.artifact.plugin | 3.4.1 |
| version.org.eclipse.jkube | 1.4.0 |
| version.org.kie.kogito | 999-SNAPSHOT |
| version.org.skyscreamer | 1.5.0 |
| version.org.webjars | 4.5.3 |
