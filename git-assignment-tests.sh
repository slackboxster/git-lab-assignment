#!/bin/bash

tests=0
passes=0
fails=0

echo_with_color ()
{
    tput setaf $1
    echo "$2"
    tput sgr0
}

pass ()
{
    #echo "$1 ... [PASS]"
    echo_with_color 2 "$1 ... [PASS]"
    ((tests++))
    ((passes++))
}

fail ()
{
    #echo "$1 ... [FAIL]"
    echo_with_color 1 "$1 ... [FAIL]"
    ((tests++))
    ((fails++))
}


# Test Task 1
test="Task 1: password has been removed from repository."

if git log --oneline --all | grep 'password'; then fail "$test"; else pass "$test"; fi

#Init Script Tests

#test="Test: vcs-init.sh errors without an argument"
#if vcs-init.sh; then fail "$test"; else pass "$test"; fi

#test="Test: vcs-init.sh succeeds with an argument"
#if vcs-init.sh hello; then pass "$test"; else fail "$test"; fi

#test="Test: vcs-init.sh fails if the target exists and isn't a directory"
#echo "hello" > hello.txt
#if vcs-init.sh hello.txt; then fail "$test"; else pass "$test"; fi

#test="Test: vcs-init.sh fails if the target exists and already contains a .repo"
#mkdir test2
#mkdir test2/.repo
#if vcs-init.sh test2 ; then fail "$test" ; else pass "$test"; fi
#
#test="Test: vcs-init.sh creates a repository if the target is an existing directory."
#mkdir test3
#vcs-init.sh test3
#if [ -d test3/.repo ]; then pass "$test" ; else fail "$test"; fi
#
#test="Test: vcs-init.sh creates a working directory and a repository."
#vcs-init.sh test4
#if [ -d test4 -a -d test4/.repo ]; then pass "$test"; else fail "$test"; fi
#
#test="Test: vcs-init.sh creates a snapshots directory"
#if [ -d test4/.repo/snapshots ]; then pass "$test"; else fail "$test"; fi
#
#test="Test: vcs-init.sh creates a refs directory"
#if [ -d test4/.repo/refs ]; then pass "$test"; else fail "$test"; fi
#
#test="Test: vcs-init.sh creates a tags directory"
#if [ -d test4/.repo/refs/tags ]; then pass "$test"; else fail "$test"; fi

##Commit Script Tests
#test="Test: vcs-commit.sh fails if run from a directory that does not contain a repository"
#if vcs-commit.sh; then fail "$test"; else pass "$test"; fi
#
#test="Test: vcs-commit.sh copies normal files into the snapshot directory"
#cd test4
#echo "hello" > hello.txt
#vcs-commit.sh
#if [ -e .repo/snapshots/1/hello.txt ]; then pass "$test"; else fail "$test"; fi
#
#test="Test: vcs-commit.sh copies hidden files into the snapshot directory"
#echo "hello" > .hello.txt
#vcs-commit.sh
#if [ -e .repo/snapshots/2/.hello.txt ]; then pass "$test"; else fail "$test"; fi
##
##test="Test: vcs-commit.sh does not copy .repo into snapshot directory."
#if [ -e .repo/snapshots/2/.repo ]; then fail "$test"; else pass "$test"; fi
#
#test="Test: vcs-commit.sh copies files recursively"
#mkdir hello
#echo "hello" > hello/hello.txt
#vcs-commit.sh
#if [ -e .repo/snapshots/3/hello/hello.txt ]; then pass "$test"; else fail "$test"; fi
#
#test="Test: vcs-commit.sh creates a .commit file in the snapshot directory"
#if [ -e .repo/snapshots/3/.commit ]; then pass "$test"; else fail "$test"; fi
#
#test="Test: vcs-commit.sh includes the current user's username in .commit"
#if grep "`whoami`" .repo/snapshots/3/.commit; then pass "$test"; else fail "$test"; fi
#
#test="Test: vcs-commit.sh accepts an optional message argument which it adds to the .commit file."
#message="this is a test message!"
#vcs-commit.sh "$message"
#if grep "$message" .repo/snapshots/4/.commit; then pass "$test"; else fail "$test"; fi
#
#test="Test: vcs-log.sh shows the commit files from the snapshots folder."
#if vcs-log.sh | grep "$message"; then pass "$test"; else fail "$test"; fi

#test="Test: vcs-tag.sh fails if two arguments are not specified"
#if vcs-tag.sh; then fail "$test"; else pass "$test"; fi
#if vcs-tag.sh 1; then fail "$test"; else pass "$test"; fi

#test="Test: vcs-tag.sh fails if the first argument is not in the snapshots directory"
#if vcs-tag.sh blaa blaa; then fail "$test"; else pass "$test"; fi

#test="Test: vcs-tag.sh creates a symbolic link with the given name in the .repo/refs/tags directory"
#vcs-tag.sh 1 blaa;
#if [ -L ".repo/refs/tags/blaa" ]; then pass "$test"; else fail "$test"; fi

#test="Test: vcs-tag.sh properly links the tag to the snapshot"
#if ls -al .repo/refs/tags/blaa | grep "> .repo/snapshots/1"; then pass "$test"; else fail "$test"; fi

if [ "$fails" -eq "0" ]; then
    echo "All Tests Passed!"
else
    echo "Tests completed with $fails tests failing."
    exit 1
fi
