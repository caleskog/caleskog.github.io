#!/bin/bash
touch .tmp

echo "Starting, this can take a minutes..."
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


# Documentation for Jakyll/minima can be found here:
# - Jakyll: 
#       * Docs:                             https://jekyllrb.com/docs/
#       * Configuring Your Jekyll Site:     https://www.aleksandrhovhannisyan.com/blog/getting-started-with-jekyll-and-github-pages/#configuring-your-jekyll-site
# - minima: https://github.com/jekyll/minima

# To see preview of drafts, add "--drafts" after "bundle exec jekyll serve".


# IF NOT WORKING OUT WITH minima, TEST --> https://quarto.org/