#!/bin/bash

# Constants
NTFY_TOPIC="<your-ntfy-topic>" # Replace with your actual ntfy.sh topic

# Function to check if wardend is installed
check_wardend_installed() {
    if ! command -v wardend &> /dev/null
    then
        echo "wardend could not be found, vist to https://docs.wardenprotocol.org/ "
    fi
}

# Function to check validator status and notify if jailed
check_validator_status() {
    local validator_address=$(wardend tendermint show-address)
    if [ -z "$validator_address" ]; then
        echo "Validator address not found. Exiting."
        exit 1
    fi

    local validator_status=$(wardend query tendermint-validator-set | grep "$validator_address")

    if [ -z "$validator_status" ]; then
        # Validator is not in the active set, possibly jailed
        echo "Validator $validator_address is possibly jailed. Sending notification."
        curl -X POST https://ntfy.sh/$NTFY_TOPIC -d "Validator $validator_address is possibly jailed."
    else
        echo "Validator $validator_address is active."
    fi
}

# Main script execution
check_wardend_installed
check_validator_status
