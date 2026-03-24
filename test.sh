#!/bin/bash

# ===== Colors =====
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

# ===== Generic print function =====
print_result() {
    local name="$1"
    local status="$2"

    echo -n "Checking ${name} ... "

    if [[ "$status" -eq 0 ]]; then
        echo -e "${GREEN}OK${RESET}"
    else
        echo -e "${RED}FAILED${RESET}"
    fi
}


# ===== Test: command exists =====
test_command() {
    local cmd="$1"

    command -v "$cmd" >/dev/null 2>&1
    print_result "command '$cmd'" $?
}


# ===== Test: directory exists =====
test_directory() {
    local dir="$1"

    [[ -d "$dir" ]]
    print_result "directory '$dir'" $?
}


# ===== Test: file exists =====
test_file() {
    local file="$1"

    [[ -f "$file" ]]
    print_result "file '$file'" $?
}

# ===== Test: Service is running =====
test_service() {
    local service="$1"

    systemctl is-active --quiet "$service"
    print_result "service '$service' active" $?
}

# return 0 = success, return 1 = fail
any_custom_test() {
    # Example: check if system has more than 1GB free on root
    local free_kb
    free_kb=$(df / | awk 'NR==2 {print $4}')

    if (( free_kb > 1000000 )); then
        return 0
    else
        return 1
    fi
}


# ===== Running all checks =====
echo "=== System Checks Start ==="

# Command checks
test_command "docker"
test_command "nano"
test_command "dialog"

# Directory checks
test_directory "/home/student/"

# File checks
test_file "/home/student/test.sh"
test_file "/etc/network/inerfaces"

test_service "docker"
test_service "sshd"

# Custom test example
any_custom_test
print_result "custom test: root filesystem free > 1GB" $?

echo "=== System Checks End ==="
