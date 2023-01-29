#!/bin/bash
touch .tmp

echo "Starting, this can take a minute..."
(bundle exec jekyll serve 2> .warnings 1> .tmp) & {
    while true; do
        output=$(rg -oN -e "http:/+\d+(\.\d+)+:\d+" .tmp)
        if [[ -n "${output}" ]]; then
            break
        fi
    done
    echo "Server address: $output"
}
wait