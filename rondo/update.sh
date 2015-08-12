#!/bin/bash

cp ~/.bash_profile .
cp -r ~/.custom_resources/ .
cp -r ~/.custom_bin/ .
cp -r ~/.ssh .
cp -r ~/.ipython/profile_default/startup/* ./ipython_startup
