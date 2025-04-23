#!/usr/bin/env bash
function rst() {
     fd --unrestricted '.*\.bkp-\d{4}-\d{2}-\d{2}_\d{2}:\d{2}:\d{2}' --maxdepth 1
}
