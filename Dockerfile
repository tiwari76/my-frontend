FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

**Step 3 — Commit both files on GitHub**

After adding both files, your repo should look like:
```
web-project/
├── index.html
├── Dockerfile
└── Jenkinsfile
