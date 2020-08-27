rake test
bundle exec rubycritic
bundle exec rubocop
bundle exec license_finder report --format html > license_report.html
