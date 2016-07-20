---
layout: post
title: "Predix programming"
excerpt: "Coding Machine Learning for the Industrial Internet"
tags: [ML, GE]
image:
# feature: pic white robots woman 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622167/45abd918-0585-11e6-8537-a58e0b55e3ec.jpg
  credit: Cyberconstruct.be
  creditlink: http://cyberconstruct.be/2015/02/digital-job-crafting/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This article examines instructions to developers from
Predix, GE's brand name for their "Industrial Internet" which 
incorporates Machine Learning, Data Science, and Artificial Intelligence.


## predixdev #

During register for a Predix account, 
each developer's GitHub account is granted access to 
the repository and a number of subrepositories
at

   * <a target="_blank" href="https://github.com/predixdev/">https://github.com/predixdev</a>


## <a name="OpenJPA">OpenJPA persistence</a> #


Eclipse v3.2 (2010) has annotation support used by OpenJPA.
defined in javax.persistence:
 which is left to the JPA vendor to implement. (OpenJPA implements it through a table sequence.)

<a target="_blank" href="https://github.com/apache/openjpa">
OpenJPA</a> is a library to manage persistence and 
object/relational mapping (ORM) for Java EE and Java SE environments
to store data in a database.

It implements the <a target="_blank" href="https://jcp.org/en/jsr/detail?id=317">
Java Persistence 2.0 spec at https://jcp.org/en/jsr/detail?id=317</a>
 that went final in 2009.

Three artifacts to implement a JPA-compliant program:

   0. An entity class
   0. A persistence.xml file
   0. A class through which you will insert, update, or find an entity.

QUESTION: XML? In 2016.  Really?

JPA supports SQL, but OpenJPA has a canonical query language 
named Java Persistence Query Language (JPQL).

Some rants about JPA:

   * http://www.ibm.com/developerworks/websphere/techjournal/0612_barcia/0612_barcia.html

   * http://openjpa.apache.org/quick-start.html

   * http://www.jpab.org/OpenJPA.html
   is not the fastest ORM/DB.

   * http://www.javaworld.com/article/2077817/java-se/understanding-jpa-part-1-the-object-oriented-paradigm-of-data-persistence.html?page=2



<a target="_blank" href="https://www.wikiwand.com/en/Apache_OpenJPA">
The Wikipedia article on it</a>
notes the source code is the basis for the core persistence engine of BEA Weblogic Server, IBM WebSphere, and the Apache Geronimo Application Server.

   * <a target="_blank" href="https://dzone.com/articles/openjpa-introductory-tutorial">
   https://dzone.com/articles/openjpa-introductory-tutorial</a>
   provides a sample Geronimo site.

http://www.javaworld.com/article/2077817/java-se/understanding-jpa-part-1-the-object-oriented-paradigm-of-data-persistence.html
notes
The JPA specification was first introduced as part of JSR 220: EJB 3.0, 
with the goal of "simplifying" the EJB entity beans programming model. 
Although it all started with entity beans and is packaged with Java EE 5.0, 
JPA can be used outside the container in a Java SE environment.

QUESTION: Why is such advanced ML tech based on such old techology? 
Well, have you seen what's in Java 8? Spring Boot?

### JPA Fields #


By default, all the fields are of type @Basic, which are persisted as-is in the database.

@Enitity signifies that a particular class is an entity class. If the entity name is different from the table name, then the @Table annotation is used; otherwise, it isn't required.

@Column provides the name of the column in a table if it is different from the attribute name. (By default, the two names are assumed to be the same.)

@Id signifies the primary key.

@Version signifies a version field in an entity. JPA uses a version field to detect concurrent modifications to a data store record. When the JPA runtime detects multiple attempts to concurrently modify the same record, it throws an exception to the transaction attempting to commit last. This prevents you from overwriting the previous commit with stale data.

@GeneratedValue signifies a strategy to assign a unique value to your identity fields automatically. The types of strategies available are IDENTITY, SEQUENCE, TABLE, and AUTO. The default strategy is auto


