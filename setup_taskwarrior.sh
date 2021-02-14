#!/bin/bash

# copy over *pem files from server
task config taskd.certificate -- ~/.task/alexander_brevig.cert.pem
task config taskd.key         -- ~/.task/alexander_brevig.key.pem
task config taskd.ca          -- ~/.task/ca.cert.pem
