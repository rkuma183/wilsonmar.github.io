What I would like to do is have a small demo NodeJS project run inside a Docker image on a cloud environment (AWS).

When a change is made to the project in GitHub, Jenkins Pipeline Groovy script would rebuild and update the host. Jenkins calls Ansible to define environment.

The baby steps are:

DONE: 
0. Create the NodeJS in GitHub
0. Create a Jenkinsfile in the project
0. Config Jenkins to begin build after downloading from GitHub

TODO:
0. Make changes in GitHub:
0. In groovy script pull all environment variables
   and echo them to Console.
