---
layout: post
title: "Code Generation"
excerpt: "It does your job better and faster than you can imagine"
tags: [Mac, Robots]
shorturl: "https://goo.gl/"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

The generation of programming code is not new, it's just gotten more important over time.

The key point is that after each change in the requirements (templates),
applications are completely re-generated again.
This is why code generation churns out higher quality code in less time, and more consistently.

By focusing on code generation code, developers leverage their time much more effectively.
Fix a bug and it applies to all other apps.

1. Mustache substitutes values from data files in places where 
   variables between {{ and }} are inserted in a template file.
   Data values are defined in JSON format.
   
   Mustache is really a concept rather than a product.
   This simple technique is implemented in a wide variety of programming languages.
   It works on individual files.

   https://www.npmjs.com/package/mustache-prestatic<br />
   repetitively creates a set of HTML files by applying the same template.

2. To generate <strong>multiple files</strong> from a single template,
   <a target="_blank" href="http://www.codesmithtools.com/product/generator">
   Generator from CodeSmith</a> is for Windows only, $299 for single developers.
   A server product is $499. Its templates (with .csp file extension) 
   are all about windows. It uses &LT% and %> markers ASP uses.
   It has templates that can generate complete applications for use on Windows,
   with ORM such as PLINQO (replacement of LINQ to SQL in C#) at<br />
   https://github.com/codesmithtools/Templates/releases

3. http://mygeneration.sourceforge.net/ is an open-source copycat of CodeSmith,
   and thus also focused on .NET Windows.
   It's no longer maintained.
   Its website http://www.mygenerationsoftware.com/ was taken over in 2015.

4. Microsoft Visual Studio has a generator called T4 (Text Generation Transformation Toolkit)

   * <a target="_blank" href="http://www.hanselman.com/blog/T4TextTemplateTransformationToolkitCodeGenerationBestKeptVisualStudioSecret.aspx">
     Scott Hanselman blogs about the T4 Template Transformation Toolkit in Visual Studio</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=XK17iNvJqQs">
   YOUTUBE video on Code Generation using T4</a> [9:38]
   <br /><br />

5. <a target="_blank" href="https://github.com/moplus/modelorientedplus">
   https://github.com/moplus/modelorientedplus</a><br />
   Mo+ - model oriented programming language and IDE for model oriented development.

6. <a target="_blank" href="http://jsonnet.org/implementation/commandline.html">
   Jsonnet</a> emits JSON on stdout from a commandline wrapper around the C API.

7. Microsoft Excel processes macros written in 
   VBA (Visual Basic for Applications) programming language that
   can programmatically output files based on the contents of the spreadsheet.

8. Configuration managers Chef and Puppet have the capability to generate files based on 
   specification files in their own format.

9. Swagger-codegen generates client code from Swagger specification files.

http://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html

