#!/bin/bash

# shellcheck disable=SC2009
ps -eZ | grep unconfined_service_t

exit 0
