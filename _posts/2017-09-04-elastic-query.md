---
layout: post
title: "Elastic Query"
excerpt: "How to get wisdom from data"
tags: [ELK, ecosystem]
shorturl: "https://goo.gl/"
image:
# elk-beat-arch-1900x500-102084.jpg
  feature: https://user-images.githubusercontent.com/300046/30410257-2d3fa8b0-98c7-11e7-9467-d35837b592a2.jpg
  credit: JP Toto on Pluralsight
  creditlink: https://app.pluralsight.com/library/courses/centralized-logging-elastic-stack/table-of-contents
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This page contains unorganized notes about queries from the Elasticsearch datastore, a part of the Elastic Stack.

This is the heart of the value from the Elastic Stack.

Elastic "democratizes" data by putting a front-end to access data in a searcheable in fast, meaningful ways.


## Architecture

0. <strong>Elasticsearch</strong> indexes (inverted) nested aggregations of data in Hadoop.

0. <strong>Curator</strong> at <a target="_blank" href="https://github.com/elasticsearch/curator">
   https://github.com/elasticsearch/curator</a>
   manages Elasticsearch indexes by enabling admins to schedule operations to optimise, close, and delete indexes.

0. <strong>Kibana</strong> does data discovery on elasticsearch cluster to identify "actionable insights"
   and presents visualization (a dashboard).

Unlike SQL databases, ES doesn't do transactions nor enforce referential integrity.
So ES distributes well.

ES is great at <strong>faceting</strong> (more than one per facet).

ES is a document store like MongoDB.

## Data structure

At the top level are <strong>indicies</strong> (indexes).

doctypes have schemas attached to them.

ES can infer data types to fields.  PROTIP: Define schemas explicitly to avoid errors in inference.


## API


## Geo queries

Polygon containment queries are parallelized.


## Machine Learning

Machine Learning is available for "Gold" level subscribers.

<a target="_blank" href="https://www.elastic.co/elasticon/conf/2017/sf/machine-learning-in-the-elastic-stack?baymax=rtp&elektra=videos&storm=video3&iesrc=ctr">
at Elastic{ON}17 London 8 March</a>
by Steve Dodson, TechLead, and
Sophie Chang, Team Lead


## References

* <a target="_blank" href="https://www.youtube.com/watch?v=lWKEphKIG8U">
   Elasticsearch (Part 1): Indexing and Querying</a> [31:15] 16 Oct 2015 at PyCon US 2013
   from <a target="_blank" href="https://www.youtube.com/user/NextDayVideo/videos">NextDayVideo</a> 
   by Erik Rose (ES Py library maintainer) who was at Mozilla.

* <a target="_blank" href="http://mantalboy.com/how-to-use-elasticsearch-to-create-a-search-api-for-an-e-commerce-website-like-amazon-com/"></a>

* <a target="_blank" href="http://elasticsearch-users.115913.n3.nabble.com/I-am-tired-of-continuously-trying-to-override-the-default-analyzer-and-tokanizer-settings-tp3350150p3354293.html">
Thinking through and debugging problems with your query

* <a target="_blank" href="http://elasticsearch-users.115913.n3.nabble.com/help-needed-with-the-query-tp3177477p3178856.html">
Another example of complicated mapping (ngram, synonyms, phonemes)</a>

* <a target="_blank" href="http://blog.avisi.nl/2012/02/22/searching-parts-of-words-with-elasticsearch/">
   Searching parts of a word</a>

* <a target="_blank" href="http://www.spacevatican.org/2012/6/3/fun-with-elasticsearch-s-children-and-nested-documents/">
   Fun with ElasticSearch's children and nested documents</a>


## More #

This is one of a series on Elastic Stack and monitoring:

{% include monitoring_links.html %}
