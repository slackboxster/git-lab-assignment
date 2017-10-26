# Git Lab Assignment [![Build Status](https://travis-ci.org/slackboxster/git-lab-assignment.svg?branch=master)](https://travis-ci.org/slackboxster/git-lab-assignment)

This assignment will give you a chance to apply your git skills and stretch them a good deal. It is based on the [ChurchConnect Mobile App](https://github.com/churchconnect/mobile-app), but modified to challenge your skills.

You will need to fork the repostory into your own github account, and clone it to your computer to accomplish the tasks.

# Automated Grading

The assignment consists of a series of tasks. After each task, you can run the tests "./git-assignment-tests.sh" to see if you have successfully completed that task. However, the project is also configured to allow automatically running the tests after each push using Travis CI. 

In order to receive a grade for the assignment, you will need to set up a travis-ci build for your fork, and modify the build status badge to point to your travis build.

To set up Travis CI for your repository:
* Sign in to [Travis CI .org](https://travis-ci.org/auth) with your github account.
* Once Travis has synchronized your GitHub repositories, go to your [Travis Profile Page]() and select the `git-lab-assignment` repository and enable it.
* The repository already contains a .travis.yml file, so you don't need to worry about that.
* Once you push up your first commit, you should be able to see travis working.
* When you look at the page for your git-lab-assignment Travis build, you should see a build status badge that looks like the one at the top of this repository.
    * Click on that build status badge
    * Choose the master branch from the first dropdown.
    * Choose Markdown from the second dropdown
    * copy the code sample that results and replace the build status code in this file with the code from your travis account.

# Notes

* If you encounter conflicts during any merges or rebases or anything else, just make up the resolution as best you can. Since you don't understand the code, it will be hard to accurately resolve the conflicts. But you're being graded on your git work, not the coding, so just make sure the git actions work out.
* If you clobber any of the following files on your master branch, download them again and commit them back up to reset. (I won't grade you on how many times you add these back. As long as the test script works (and you haven't modified it), I'll be grading based on how many of the tasks you are able to complete).
    * The `README.md` file
    * The `.travis.yml` file
    * The `git-assignment-tests.sh` file
    * Also note that you hopefully won't clobber these files as each task is given its own branch.

# Tasks

## Task 1:

* There is a password commited at the beginning of the `task-1` branch. That commit needs to be completely removed.
* Remove that commit using either the rebase or the cherry pick approach from this website: https://www.clock.co.uk/insight/deleting-a-git-commit
    * the rebase approach command example reads as such: `git rebase --onto <branch name>~<first commit number to remove> <branch name>~<first commit to be kept> <branch name>`
    * another way to say it is `git rebase --onto <new source commit> <old source commit> <branch you are rebasing>`
    * another way is: `git rebase --onto <commit hash before the password commit> <commit hash after the password commit> <branch you are removing the password from>`
* Once you are done removing the commit, use the force to push your changes (git push -f origin task-1)
* Notes and hints:
    * When you do git log, you hit `/` to search for words. So `/password` should find you the commit containing the password. 
    * You can also use `git log | grep 'password'` to find the commit hash.
    * Note: pay close attention to the output of the rebase command and the output of git status when it hits a stopping point. Most of the time git tells you what you need to do next.


# Task 2:
* Simple rebase...

# Git Resources:

* How to remove a commit: https://www.clock.co.uk/insight/deleting-a-git-commit
* In depth on rebasing: https://git-scm.com/book/en/v2/Git-Branching-Rebasing
