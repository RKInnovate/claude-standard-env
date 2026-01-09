#!/usr/bin/env bash

#
# Anthropic API Key Helper Script
#
# This script is called by Claude Code to retrieve your Anthropic API key.
# Claude Code expects this script to output the API key to stdout.
#
# IMPORTANT: Add your actual API key below
#

# Replace 'your-api-key-here' with your actual Anthropic API key
# You can get your API key from: https://console.anthropic.com/settings/keys
API_KEY="your-api-key-here"

# Output the API key
echo "$API_KEY"
