#!/bin/bash
gunicorn main:app -k uvicorn.workers.UvicornWorker --timeout 60