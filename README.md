# Start Development Environment with Tmux Script

- starts tmux session;
- names it;
- sets variables
  - Root Folder (Current Folder) 
  - Application Folder (/frontend/)
  - Database Project Folder 
  - Contract Tests Folder (Current Folder)
- splits session 4 panes
- executes commands if they were given 

Usage:

``curl -s https://raw.githubusercontent.com/emrea-works/start_dev_env/master/start_dev.sh > start_dev && chmod 744 start_dev``

``./start_dev ``
