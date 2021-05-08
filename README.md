# DevOps Assessment
- Submit all sources for both solutions as a link to a single Git repository
- Submissions as archive file (tar, zip) are also accepted but discouraged
## Challenge 1: Github Stats
### Task
Write an application/script that accepts a list of public Github repositories and prints out
the name, clone URL, date of latest commit and name of latest author for each one
### Input
- Read plain text list of repositories from stdin
- One repo per input line, format: $orgname/$repo, e.g. kubernetes/charts
- Other parameters/env vars as needed, should be documented
### Output
- One line per input repo in CSV or TSV format plus one header line to stdout
### Notes
- Solutions can be done in Python, Golang, NodeJS or Bash
- Solution should include dependency management for the language chosen
- Please provide a Dockerfile
## Challenge 2: Docker Nginx + Log Management
### Task
- Deploy a Dockerized application serving a static website via (e.g. via Nginx) that displays
a custom welcome page (but not the default page for the web server used)
- Use fluentd to ship Nginx request logs to an output of your choice (e.g. S3,
ElasticSearch)
- Provide a standalone solution including both webapp and fluentd using docker-compose
and/or a kubernetes deployment (plain manifest or helm chart)
### Notes
- Avoid running multiple services in single container
- You can use any 3rd party Docker image (you might have to explain your choice)
- Bonus: use an IAC tool of your choice to create cloud resources you may need (e.g. S3
buckets)
