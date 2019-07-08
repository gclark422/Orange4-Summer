# Orange4-Summer
IAA Orange Summer Team 4 Practicum Project
____
## Setup Instructions
- Connect to the VPN and remote desktop into the server
- Once in the server determine where you want to clone the repo
- For the sake of keeping this simple, keep the repo on your server C:\ drive
- For example: `C:\Users\[your username]\Documents\summer practicum\`
- Open the Windows Start menu and type `Git CMD` and press enter
- Navigate to the directory you want this repo to be in
```bash
$ cd C:\Users\[Your username]\Documents\[Some folder name you came up with]\
$ git clone https://github.com/gclark422/Orange4-Summer.git
$ cd Orange4-Summer
```
- You are now in the git repo! Good job!
- To work on something new **PLEASE** checkout a branch! Here's how!
```bash
$ git checkout -b [branch name]
```
- Keep branch names short and sweet. Example: "Grant data step"
- Here's how to add files to commit and push
- *After doing some changes/working on new files*
```bash
$ git status    (always do this - it will give you useful info)
$ git add --all 
```
--OR--
```bash
$ git add [name specific files]
$ git commit -m "[message]"
```
- Keep the commit messages short and informative of what you worked on.
- For example: "Fixed a bug in the data step"
- After you have commited everything you want to (you can have multiple commits if you work on something, take a break then come back it's good practice to commit your changes) you're ready to push!
```bash
$ git push origin [branch name]
```
- **Always push to the name of the branch you're working on**
- After this you will be asked to login
- Next open up github.com and go to the reop page and you will have an option to open a Pull Request. 
- In this pull request you should type out nicely everything you worked on and what you changed
- Then your PR will have to be approved and merged then you're done!
- I know this seems like a lot but I promise it isnt that bad!
_______
- For now when you checkout a new branch just make a new SAS file to work in if you need to do something so we don't have to deal with merge conflicts.
- When you start working for the day do `git pull origin master`

