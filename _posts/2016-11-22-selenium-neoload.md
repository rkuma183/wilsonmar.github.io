---
layout: post
title: "Selenium NeoLoad"
excerpt: "Create NeoLoad scripts from Selenium to load test sooner"
tags: [Mac, Perftest]
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

Although Selenium was created for functional testing,
it can now be used to emulate users while network traffic is captured by
NeoLoad to create performance testing user paths (scripts).

NeoLoad is a professional (licensed) load testing software that enables 
analysis of user response times and infrastructure's statistics (database, Web server, network components, etc.) under simulated load.
NeoLoad takes the place of real client browsers to 
stimulate large numbers of users using an application simultaneously.

The NeoLoad Design API can convert Selenium scripts to NeoLoad scripts.
 
NOTE: The NeoLoad API for Selenium also enables capture of end-user experience measurements and 
equate them back into the NeoLoad results set.
This makes use the NeoLoad’s Java Launcher action.

The benefit of functional scripts to create performance scripts not only optimize staff time,
the capability enables developers to achieve the speed needed to include
performance testing as part of System Demos at the end of each Agile sprint.


<hr />

### Installers needed

Follow my other tutorials to install:

1. [Java](/java-on-apple-mac-osx/)
2. [Maven](/maven-on-macos/) to build Java after processing the pom.xml file of dependencies
3. Chrome with ChromeDriver
4. <a href="#Firefox">Firefox browser</a>
5. GeckoDriver
6. Eclipse or IntelliJ IDE (optionally)
7. Selenium
8. <a href="#NeooLoadInstall">NeoLoad 6.0</a>
9. Sample app (Pet Store, Pet Clinic, etc.)
<br /><br />

## Docker image

   The easiet way is to use Docker to download an image where installers have already been run.

   Examples from the documentated have been pre-integrated in the sample code:

0. Change to a folder where you can get a sample repo on your local hard drive.
   For example, `gits`.

   <tt><strong>cd ~/gits
   git clone https://github.com/wilsonmar/SeleniumJavaNeoLoad \-\-depth=1
   </strong></tt>

   `--depth=1` specifies the depth of history. It's 1 since we don't want to update it, just use the latest version. 
   Thus we save some disk space.

0. Have Maven download Java dependencies specified in the app's <strong>pom.xml</strong> file:

   <tt><strong>cd SeleniumJavaNeoLoad
   mvn clean install
   </strong></tt>


0. <a href="#Demo">Skip the below and go straight to the demo</a>


<hr />

## Converting Selenium to NeoLoad

   Below are implementation of what is documented in
   "Integration with Selenium" section of the NeoLoad on-line documentation at<br />
   https://www.neotys.com/documents/doc/neoload/latest/en/html/#8266.htm

   Documentation for working in Java or C##:
 
   * https://www.neotys.com/documents/doc/neoload/latest/en/html/#24373.htm


### Supported versions

Regarding user experience measurements, the navigation library is available in the browsers listed here.

Measurement of the time elapsed on the end-user side is enabled by the 
<a target="_blank" href="https://www.w3.org/TR/navigation-timing/">
W3C Navigation Timing library at https://www.w3.org/TR/navigation-timing</a>
which on July 2017 is 
<a target="_blank" href="http://caniuse.com/#feat=nav-timing">
supported by leading modern internet browsers.


The wrapper NLWebDriver provided by Neotys 
can be used without any interaction with NeoLoad.
Therefore it doesn't impact existing functional tests.
It allows to convert on the fly Selenium scripts into NeoLoad User Paths.

You can create or maintain existing User Paths in your automated tests processes.
NeoLoad can collect end-user experience and sends to 
NeoLoad the metrics calculated on the client (browser or mobile devices).
 

## Configuring Selenium Java projects

Maven is the recommended tool to configure your Java project.

0. In the pom.xml file that Maven processes for Java projects,
   a dependency is added:

Repository:

   ```
<repositories>
  <repository>
      <id>neotys-public-releases</id>
      <url>http://maven.neotys.com/content/repositories/releases/</url>
      <releases><enabled>true</enabled></releases>
      <snapshots><enabled>false</enabled></snapshots>
  </repository>
</repositories>
   ```

Dependency:

   ```
<dependencies>
  <dependency>
    <groupId>com.neotys.selenium</groupId>
    <artifactId>neotys-selenium-proxy</artifactId>
    <version>2.0.6</version>
  </dependency>
  <dependency>
    <groupId>org.seleniumhq.selenium</groupId>
    <artifactId>selenium-java</artifactId>
    <version>2.0.6</version>
  </dependency>
</dependencies>
   ```

0. TODO: Change the version appropriate for (as of July 2017),
   the current latest version 6 of NeoLoad.

   CAUTION: According to the documentation at ____,
   NeoLoad integration has been tested on Selenium versions: 2.53.0 and 3.0.1.

   A project is not developed using Maven, it is necessary to add
   the Selenium proxy JAR with dependencies available for download on the Neotys Labs page.

   jar-with-dependencies

   The Selenium proxy JAR includes Selenium version 2.53.0.

0. Before integrating with NeoLoad, test your Selenium script to make sure it is functional.


   ### Customize Selenium scripts

   Using <strong>wrapper code</strong> allows quick and easy integration with existing Selenium test cases with minimal changes to existing code. Page load times and any error messages are sent to NeoLoad as external data.

   Replace the appropriate line of code to create the driver and use the NeoLoad driver instead:

   <pre>
import static com.neotys.selenium.proxies.NLWebDriverFactory.addProxyCapabilitiesIfNecessary;
import org.openqa.selenium.remote.DesiredCapabilities;
import com.neotys.selenium.proxies.NLWebDriver;
import com.neotys.selenium.proxies.NLWebDriverFactory;
   </pre>


   ### Set the mode

There are 3 modes to use the NeoLoad wrapper:

   * "NoApi" - This is the default mode. In this mode, there is no interaction with NeoLoad.
   * "Design" - a User Path is automatically created or updated through the Design API.
   * "EndUserExperience" - Selenium time measurements are sent to NeoLoad through the Data Exchange API.

   To set the mode, use the `nl.selenium.proxy.mode` property.

   The property needs to be passed as a VM option or a program argument.

   Examples: `-Dnl.selenium.proxy.mode=Design` or 
   `-Dnl.selenium.proxy.mode=EndUserExperience`.

## Methods of the Selenium wrapper

The Neotys Selenium wrapper is compatible in all JUnit Selenium test scripts.

To specify the scenarios you want to update,
launch tests with Maven without specifying particular options or 
use the Design option and several dedicated methods on top of the Selenium driver 

   | Method | Description | Example |

* NLWebDriver(Selenium webdriver,Name of the NeoLoad User Path, path to the NL project);

* NLWebDriver is the constructor of the NeoLoad webdriver.
   This constructor allows you to specify the project that is to be updated with the new/updated User Path.

   ```
final FirefoxDriver webDriver = new FirefoxDriver(addProxyCapabilitiesIfNecessary(new DesiredCapabilities()));
// projectPath used to open NeoLoad project, null to use the currently opened Project.
final String projectPath = "C:\\Users\\apaul\\projects\\Sample_Project.nlp";
NLWebDriver driver = NLWebDriverFactory.newNLWebDriver(webDriver, "SeleniumUserPath", projectPath);
NLWebDriver(Selenium webdriver,Name of the NeoLoad User Path);
Project path is optional.
If the project is not specified, the wrapper will use the currently opened project.
final FirefoxDriver webDriver = new FirefoxDriver(addProxyCapabilitiesIfNecessary(new DesiredCapabilities()));
&nbsp;   
NLWebDriver driver = NLWebDriverFactory.newNLWebDriver(webDriver, "SeleniumUserPath");
StartTransaction(Name of the current transaction);
This method sends all the Selenium HTTP/HTTPS traffic into a specific NeoLoad container.
This methods needs to be used before the Selenium actions related to a business transaction.
public void testGetAlerts() {
driver.startTransaction("home2");
driver.get("http://ushahidi.demo.neotys.com/");
driver.startTransaction("alerts");
driver.findElement(By.partialLinkText("GET ALERTS")).click();
}
   ```

### Start Transactions

Transactions are defined to begin and stop specific time counters.

In this example, transactions can be added with the `startTransaction` method 
when creating or updating User Paths.

   ```
driver.startTransaction("home");
driver.get("http://ushahidi.demo.neotys.com/");
   ```

   Whenever the mode is not set to "Design", calls to startTransaction are ignored.


### Example 1

The Selenium driver is started once and stopped at the end of the whole test. Only one User Path is created or updated.

   ```
package com.selenium.test;
import static com.neotys.selenium.proxies.NLWebDriverFactory.addProxyCapabilitiesIfNecessary;
import java.io.File;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import com.neotys.selenium.proxies.NLWebDriver;
import com.neotys.selenium.proxies.NLWebDriverFactory;
public class UnitTest {
  private static final String CHROME_DRIVER_PATH = "C:\\Selenium\\chromedriver.exe";
  static {
    final File file = new File(CHROME_DRIVER_PATH);
    System.setProperty("webdriver.chrome.driver", file.getAbsolutePath());
  }
  static NLWebDriver driver;
&nbsp;  
  @BeforeClass
  public static void before() {
    final ChromeDriver webDriver = new ChromeDriver(addProxyCapabilitiesIfNecessary(new DesiredCapabilities()));
    &nbsp;
    // projectPath used to open NeoLoad project, null to use currently opened Project.
    final String projectPath = "C:\\Users\\anouvel\\Documents\\NeoLoad Projects\\v5.3\\Sample_Project\\Sample_Project.nlp";
    &nbsp;
    driver = NLWebDriverFactory.newNLWebDriver(webDriver, "SeleniumUserPath", projectPath);
  }
  @Test
  public void testSubmit() {
    driver.startTransaction("home1");
    driver.get("http://ushahidi.demo.neotys.com/");
    &nbsp;
    driver.startTransaction("reports");
    driver.findElement(By.id("mainmenu")).findElements(By.tagName("a")).get(1).click();
    &nbsp;
    driver.startTransaction("submit");
    driver.findElement(By.partialLinkText("SUBMIT")).click();
  }
  &nbsp;
  @Test
  public void testGetAlerts() {
    driver.startTransaction("home2");
    driver.get("http://ushahidi.demo.neotys.com/");
    &nbsp;
    driver.startTransaction("alerts");
    driver.findElement(By.partialLinkText("GET ALERTS")).click();
  }
  &nbsp;
  @AfterClass
  public static void after() {
    if (driver != null) {
      driver.quit();
    }
  }
}
   ```

Example 2

The Selenium driver is started before each test and stopped at the end of each test. 
One User Path is created or updated per test.

   ```
package com.selenium.test;
import static com.neotys.selenium.proxies.NLWebDriverFactory.addProxyCapabilitiesIfNecessary;
import java.io.File;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestName;
import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import com.neotys.selenium.proxies.NLWebDriver;
import com.neotys.selenium.proxies.NLWebDriverFactory;
public class UnitTest2 {
  private static final String CHROME_DRIVER_PATH = "C:\\Selenium\\chromedriver.exe";
    
  static {
    final File file = new File(CHROME_DRIVER_PATH);
    System.setProperty("webdriver.chrome.driver", file.getAbsolutePath());
  }
    
  @Rule
  public TestName testName = new TestName();
    
  NLWebDriver driver;
  
  @Before
  public void beforeTest() {
    final ChromeDriver webDriver = new ChromeDriver(addProxyCapabilitiesIfNecessary(new DesiredCapabilities()));
    final String projectPath = "C:\\Users\\anouvel\\Documents\\NeoLoad Projects\\v5.3\\Sample_Project\\Sample_Project.nlp";
    driver = NLWebDriverFactory.newNLWebDriver(webDriver, testName.getMethodName(), projectPath);
  }
  
  @Test
  public void testSubmit() {
    driver.startTransaction("home");
    driver.get("http://ushahidi.demo.neotys.com/");
  
    driver.startTransaction("reports");
    driver.findElement(By.id("mainmenu")).findElements(By.tagName("a")).get(1).click();
  
    driver.startTransaction("submit");
    driver.findElement(By.partialLinkText("SUBMIT")).click();
  }
  
  @Test
  public void testGetAlerts() {
    driver.startTransaction("home");
    driver.get("http://ushahidi.demo.neotys.com/");
  
    driver.startTransaction("alerts");
    driver.findElement(By.partialLinkText("GET ALERTS")).click();
  }
  
  @Test
  public void testSubmitIncident(){
    driver.startTransaction("home");
    driver.get("http://ushahidi.demo.neotys.com/");
    
    driver.startTransaction("submit-incident");
    driver.findElement(By.className("submit-incident")).click();
    driver.findElement(By.id("incident_title")).sendKeys("Title");
    driver.findElement(By.id("incident_description")).sendKeys("Description");
    driver.findElement(By.id("location_name")).sendKeys("Gémenos, France");
    driver.findElement(By.cssSelector("input[type='checkbox'][value='2']")).click();
    driver.findElement(By.className("btn_submit")).click();
  }
  
  @After
  public void afterTest() {
    if (driver != null) {
      driver.quit();
    }
  }
}
   ```

Use the Selenium driver as a Maven task.
If you want to launch only a subset of unit tests, you can use the Maven surefire plugin.
You will need to include the following plugin in your pom.xml :

   ```
<plugin>
 <groupId>org.apache.maven.plugins</groupId>
 <artifactId>maven-surefire-plugin</artifactId>
   <version>2.19.1</version>
    <dependencies>
     <dependency>
        <groupId>org.apache.maven.surefire</groupId>
        <artifactId>surefire-junit47</artifactId>
   <version>2.19.1</version>
     </dependency>
    </dependencies>
</plugin>
   ```

   The plugin launches tests defined within the test repository of your Maven project.
   For example, the command below only launches the test classes that end with "PerformanceTest":

   ```
mvn -Dnl.selenium.proxy.mode=Design -Dnl.design.api.url=http://[host]:7400/Design/v1/Service.svc/ -Dtest=*PerformanceTest clean test
   ```


Methods of the Selenium wrapper
Method
Description
Example
NLWebDriver(Selenium webdriver,Name of the NeoLoad User Path, path to the NL project);
NLWebDriver is the constructor of the NeoLoad webdriver.
This constructor allows you to specify the project that is to be updated with the new/updated User Path.
final FirefoxDriver webDriver = new FirefoxDriver(addProxyCapabilitiesIfNecessary(new DesiredCapabilities()));

// projectPath used to open NeoLoad project, null to use the currently opened Project.
final String projectPath = "C:\\Users\\apaul\\projects\\Sample_Project.nlp";
NLWebDriver driver = NLWebDriverFactory.newNLWebDriver(webDriver, "SeleniumUserPath", projectPath);
NLWebDriver(Selenium webdriver,Name of the NeoLoad User Path);
Project path is optional.
If the project is not specified, the wrapper will use the currently opened project.
final FirefoxDriver webDriver = new FirefoxDriver(addProxyCapabilitiesIfNecessary(new DesiredCapabilities()));
 
NLWebDriver driver = NLWebDriverFactory.newNLWebDriver(webDriver, "SeleniumUserPath");

#### setCustomName

This method sets a custom name of the next Entry that will be sent to the Data Exchange server.

   ```
driver.SetCustomName("custom entry name");
   ```

### Advanced usage

The Java proxy sets a custom name of the next Entry that will be sent to the Data Exchange server.

Additionally there is a method to retrieve the regular expression being used to create the path when the 
`nl.path.naming.policy argument` is set to URL.

The example below illustrates these advanced uses:

   ```
NLWebDriver driver = WebDriverProxy.newInstance(new FirefoxDriver());
driver.setCustomName("custom entry name");
System.out.println("Escaped regular expression: " + driver.getRegexToCleanURLs());
   ```

#### Create manual timers

If the tested application is not compatible with the navigation timing library, 
you can still create your own timers manually by using the DataExchange client library.

In order to send external data to NeoLoad without Java, 
you can create custom timers manually, either from scratch or with the help of our utility TimerBuilder.

To create manual timers, you need first to create the Data Exchange API Client as described below.

The NeoLoad Data Exchange API Client provides the utility TimerBuilder in order to time a transaction (a set of business actions).
Below is an example of Java code to add a timer.

   ```
import com.neotys.rest.dataexchange.model.TimerBuilder;

// Start timer
final TimerBuilder timer = TimerBuilder.start("scriptName", "timerName");

// Do some transactions, for example:
vpba16.avw_backboneCellarAndro.avw_.mo_cHATEAU_LE_DOYENNE.click();

// Stop timer
dataExchangeAPIClient.addEntry(timer.stop());
   ```

To enhance the timer’s information with specific data, for example a URL, a status, etc. 

   ```
import com.neotys.rest.dataexchange.model.Status.State;
import com.neotys.rest.dataexchange.model.TimerBuilder;
import com.neotys.rest.dataexchange.model.Status;
import com.neotys.rest.dataexchange.model.Status.State;
import com.neotys.rest.dataexchange.model.StatusBuilder;

// Start timer
final TimerBuilder timer = TimerBuilder.start("scriptName", "timerName");

// Do some transactions, for example:
vpba16.avw_backboneCellarAndro.avw_.mo_cHATEAU_LE_DOYENNE.click();

// Specify URL
timer.url("myURL");

// Specify Status
final Status status = (new StatusBuilder()).code("code").message("message").state(State.PASS).build();

timer.status(status);

// Stop timer
dataExchangeAPIClient.addEntry(timer.stop());
   ```

The transactions’ timers are then accessible in the Runtime and Results views of NeoLoad:


### Timers-Results

Metrics retrieved by the Selenium wrapper

The Selenium wrapper automatically retrieves navigation timers and sends them to the NeoLoad Data Exchange API.

All metrics sent to NeoLoad are specified in milliseconds.

These metrics are available during runtime and once the test is complete in the Runtime and Results sections:

   * Time to First Byte
   * DOM content loaded
   * On Load
   * Document complete


### Configuration options

All options except the driver instance are passed via command line arguments.

Tip: Arguments may require quotation marks to function properly. For example: 

   "-Dnl.script.name=my_name" instead of -Dnl.script.name=my_name.

Argument
Description
new FirefoxDriver()
(Required) Any driver that returns a WebDriver interface.
 
NLWebDriver driver = WebDriverProxy.newInstance(new FirefoxDriver());
or
NLSelenium selenium = WebDriverBackedSeleniumProxy.newInstance(new WebDriverBackedSelenium(new FirefoxDriver(), baseUrl));
nl.api.key
(Optional) The API key to send to NeoLoad.
Default: <none>
nl.data.exchange.url
(Required) The URL to the data exchange server on the NeoLoad Controller.
Example: -Dnl.data.exchange.url=http://localhost:7400/DataExchange/v1/Service.svc/
Default: http://localhost:7400/DataExchange/v1/Service.svc/
nl.debug
(Optional) Prints various information from the Selenium proxy wrapper to standard out.
Default: false
Example:
-Dnl.debug=true
nl.design.api.url
(Required) The URL to the Design API server on the NeoLoad Controller.
Example: -Dnl.design.api.url=http://localhost:7400/Design/v1/Service.svc/
Default: http://localhost:7400/Design/v1/Service.svc/
nl.hardware
(Optional) Specify this setting for the external data Entry.
Default: <none>
nl.instance.id
(Optional) The instanceID to use.
Default: <date/time stamp>
nl.location
(Optional) Specify this setting for the external data Entry.
Default: <none>
nl.os
(Optional) Specify this setting for the external data Entry.
Default: Windows, Linux, Mac OS, etc. (based on the operating system)
nl.path.naming.policy
(Optional) This is used to set the naming policy. The argument must be URL, Title, or Action.
URL: Use the last part of the URL as the Entry path.
Title: Use the page title as the Entry path.
Action: Use the last action as the Entry path. Actions can be link selections or clicks.
Default: URL
Example:
-Dnl.path.naming.policy=Title
nl.regex.to.clean.urls
(Optional) Used in conjunction with the URL PathNamingPolicy. This specifies the regular expression used to extract a path from a URL. When multiple groups are used, all matching text from each group is used in the path.
Default: (.*?)[#?;%].*
Example: -Dnl.regex.to.clean.urls=.*?\\\?(.*?)|(.*?)[#?;%].*|(.*)
Note that this example becomes .*?\?(.*?)|(.*?)[#?;%].*|(.*) after escaping
nl.script.name
(Optional) Specify this setting for the external data Entry.
Default outside of JUnit: SeleniumDelegate
Default in a JUnit test: SeleniumDelegate-<test method name>
nl.selenium.proxy.enabled
(Deprecated) Enables or disables creating and sending entries.
Default: True
nl.software
(Optional) Specify this setting for the external data Entry.
Default: <none>


### Export Selenium scripts

After customizing the Selenium test scripts, export the Java project to a runnable JAR file so that it can be launched by NeoLoad.

Tip: If you want a launch configuration that contains the test class to execute, create a TestSuite class by adapting the example below:

   ```
import org.junit.runner.JUnitCore;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
    
@RunWith(Suite.class)
    
@Suite.SuiteClasses({
   HomeTest.class,
   ReportTest.class
})
    
public class EndUserExperienceTestSuite {
  public static void main(String[] args) throws Exception {
         JUnitCore.main(EndUserExperienceTestSuite.class.getName());            
  }
}
   ```

If you are working in the Eclipse IDE, export the Selenium scripts, follow the steps below:

1. Right-click on your Eclipse project and select Export to a Runnable JAR file.

   nl-exportjarfileselenium

### Export Jar File Selenium

Enter a project name, specify the directory where to save the JAR file:

   nl-runnablejarspecselenium

in the /custom-resources folder of your NeoLoad project

   nl-runnablejarspecselenium

in the /extlib directory of your NeoLoad installation for multi-project usage, click Finish.

The file will be automatically sent to Load Generators when a test is run.


## Start Selenium scripts

"User Experience" scripts created in Selenium are started by NeoLoad's Java Test Script advanced action.

For more information about the Java Test Script advanced action, refer to the Java Test Script Launchers documentation.

The following configuration is required:

JRE is the path to the Java Runtime Environment executable on the Load Generator

   * Attribute arg1 must be: -jar
   * Attribute arg2 must contain the path of the JAR file that was exported, either its absolute path or the path relative to the custom-resources folder in the NeoLoad project: ${NL-CustomResources}/myjar.jar
   * Attribute arg3 must contain the mode -Dnl.selenium.proxy.mode=EndUserExperience
   * Attribute arg4 must contain the mode -Dnl.data.exchange.url=http://192.168.1.6:7400/DataExchange/v1/Service.svc/

nl-seleniumjavaproxyconfigoptions2.png

### Configure the NeoLoad scenario

To configure your User Experience scenario, follow the guidelines documented in the End User Experience Integration User Guide.


### See run results

The external data injected during execution is displayed in Results > Details.
For more information, see by external data.

https://www.neotys.com/documents/doc/neoload/latest/en/html/#1484.htm#o7602


### License setup

License module "Integration & Advanced Usage" is required to enable the End User Experience Integration.

   * https://www.neotys.com/documents/doc/neoload/latest/en/html/#8269.htm
 
0. Get to the "NeoLoad Selenium Proxy Driver" from the  
   https://www.neotys.com/support/neotys-labs/selenium-proxy-driver-for-end-user-experience

   <a target="_blank" href="https://www.neotys.com/support/neotys-labs">
   Neotys Labs page at https://www.neotys.com/support/neotys-labs</a>.
   
   The direct link for Java at time of writing is:
 
   <a target="_blank" href="https://www.neotys.com/support/neotys-labs/selenium-proxy-driver-for-end-user-experience">
   https://www.neotys.com/support/neotys-labs/selenium-proxy-driver-for-end-user-experience</a>

   https://www.neotys.com/support/neotys-labs/selenium-proxy-driver-c-automated-script-maintenance-end-user-experience

   The Selenium Proxy Driver allows you to use a Selenium script to create or update NeoLoad User Paths and/or measure the end user experience on one or a few browsers or mobile devices and to send these measurements to NeoLoad.

0. Click "Download: Jar" link to download file:

   neotys-selenium-proxy-2.0.6.jar

0. Click "Jar-with-dependencies" link to download file:

   neotys-selenium-proxy-with-dependencies-2.0.6
 
0. Optionally, click "Source" link to download file:

   neotys-selenium-proxy-2.0.6-sources
 
0. Optionally, click "Javadoc" link to download file:

   neotys-selenium-proxy-2.0.6-javadoc
 
0. In your Downloads folder, invoke the "Selenium Proxy Driver" from the 

   

0. Modify Selenium scripts to indicate the NeoLoad Selenium driver.

0. Modify Selenium scripts to add timers that will be converted into NeoLoad "transactions".
 
0. Set the mode appropriately for the Selenium execution:

   https://www.neotys.com/documents/doc/neoload/latest/en/html/#23462.htm
 

<a name="Demo"></a>

## Demo


## References

https://www.youtube.com/watch?v=x0RE2_MLCLQ
Continuous Performance Testing and Monitoring in Agile Development
by Neotys 
