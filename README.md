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

![traveloka](https://ik.imagekit.io/tvlk/blog/2020/01/Traveloka_Primary_Logo.png?tr=dpr-1,w-675)
# Solution
## Challenge 1: Github Stats
### How-To
- Create file named `repos.txt` with format one repo per input line, e.g. kubernetes/charts
- Run following script
```
./run-challenge-1.sh
```
### Notes
- If API exceeded rate limit, app will sleep until rate limit is reset

---
## Challenge 2: Docker Nginx + Log Management
### Prerequisite
- Terraform v0.15.3
- kubectl with valid kubernetes cluster configuration
- helm v3.5.4
### How-To
- Populate `.env`
- Run following script
```
./run-challenge-2.sh
```

### Notes
- Application can be viewed by running following command
```
kubectl port-forward svc/tvlk-assessment-2-sample-app 8080:80
```
- Go to this address
```
localhost:8080
``` 