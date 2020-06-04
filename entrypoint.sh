#!/bin/sh
function setup_gcp_config {
  # Check for project id
  if [ -z "$INPUT_PROJECT_ID" ]
  then
    echo "Project id was not found. Using the configuration settings from a previous step."
  else
    gcloud config set project "$INPUT_PROJECT_ID"
  fi

  # Check for creds
  if [ -z "$INPUT_APPLICATION_CREDENTIALS" ]
  then
    echo "Application credentials was not found. Using the configuration settings from a previous step."
  else
    echo "$INPUT_APPLICATION_CREDENTIALS" | base64 -d > /tmp/account.json
    gcloud auth activate-service-account --key-file=/tmp/account.json
  fi
}

function run_commands {
  if [ -z "$INPUT_COMMANDS" ]
  then
    echo "Commands not set."
  else
    for command in $(echo $INPUT_COMMANDS | sed "s/|/ /g")
    do
      sh -c "$command"
    done
  fi
}

function run_command {
  if [ -z "$INPUT_COMMAND" ]
  then
    echo "Command not set."
  else
    sh -c "$INPUT_COMMAND"
  fi
}

function main {
  setup_gcp_config
  run_commands
  run_command
}

main
