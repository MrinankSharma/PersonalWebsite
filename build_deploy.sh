#!/bin/bash
hugo; cd public; git add .; git commit -m "build & update"; git push origin master; cd ../
