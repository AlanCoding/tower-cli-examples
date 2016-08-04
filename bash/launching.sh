# dependencies:
#  - demo.sh

# different ways to launch a job
# - via a job template
#   - providing runtime data
# - ad hoc command
# - through the direct launch endpoint


tower-cli job launch -J "Hello World" --monitor
tower-cli job launch -J "Hello World prompting" --tags "tag2" --no-input --monitor
tower-cli job launch -J "Hello World" --tags "tag1" --use-job-endpoint --monitor

