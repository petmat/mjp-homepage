@echo off

call dependencies.cmd

@echo "Running web server"
call packages\FAKE\tools\FAKE.exe %* --fsiargs build.local.fsx