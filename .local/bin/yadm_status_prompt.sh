#!/usr/bin/bash
# initial code from https://github.com/denysdovhan/spaceship-prompt/blob/master/sections/git_status.zsh

#
# Git status
#


# ------------------------------------------------------------------------------
# Local Config
# ------------------------------------------------------------------------------

# Don't like stashed show up, I usually always have something stashed in the main repo
SPACESHIP_GIT_STATUS_STASHED=""

# ------------------------------------------------------------------------------
# Utils (from https://github.com/denysdovhan/spaceship-prompt/blob/master/lib/utils.zsh)
# ------------------------------------------------------------------------------

# spaceship::is_git() {
#   # See https://git.io/fp8Pa for related discussion
#   [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
# }



# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------


SPACESHIP_GIT_STATUS_SHOW="${SPACESHIP_GIT_STATUS_SHOW=true}"
SPACESHIP_GIT_STATUS_UNTRACKED="${SPACESHIP_GIT_STATUS_UNTRACKED="?"}"
SPACESHIP_GIT_STATUS_ADDED="${SPACESHIP_GIT_STATUS_ADDED="+"}"
SPACESHIP_GIT_STATUS_MODIFIED="${SPACESHIP_GIT_STATUS_MODIFIED="!"}"
SPACESHIP_GIT_STATUS_RENAMED="${SPACESHIP_GIT_STATUS_RENAMED="»"}"
SPACESHIP_GIT_STATUS_DELETED="${SPACESHIP_GIT_STATUS_DELETED="✘"}"
SPACESHIP_GIT_STATUS_STASHED="${SPACESHIP_GIT_STATUS_STASHED="$"}"
SPACESHIP_GIT_STATUS_UNMERGED="${SPACESHIP_GIT_STATUS_UNMERGED="="}"
SPACESHIP_GIT_STATUS_AHEAD="${SPACESHIP_GIT_STATUS_AHEAD="⇡"}"
SPACESHIP_GIT_STATUS_BEHIND="${SPACESHIP_GIT_STATUS_BEHIND="⇣"}"
SPACESHIP_GIT_STATUS_DIVERGED="${SPACESHIP_GIT_STATUS_DIVERGED="⇕"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# We used to depend on OMZ git library,
# But it doesn't handle many of the status indicator combinations.
# Also, It's hard to maintain external dependency.
# See PR #147 at https://git.io/vQkkB
# See git help status to know more about status formats
spaceship_git_status() {
  [[ $SPACESHIP_GIT_STATUS_SHOW == false ]] && return

  local INDEX git_status=""

  INDEX=$(command yadm status --porcelain -b 2> /dev/null)

  # Check for untracked files
  if echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null; then
    git_status="$SPACESHIP_GIT_STATUS_UNTRACKED$git_status"
  fi

  # Check for staged files
  if echo "$INDEX" | command grep '^A[ MDAU] ' &> /dev/null; then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  elif echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null; then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  elif echo "$INDEX" | command grep '^UA' &> /dev/null; then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  fi

  # Check for modified files
  if echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null; then
    git_status="$SPACESHIP_GIT_STATUS_MODIFIED$git_status"
  fi

  # Check for renamed files
  if echo "$INDEX" | command grep '^R[ MD] ' &> /dev/null; then
    git_status="$SPACESHIP_GIT_STATUS_RENAMED$git_status"
  fi

  # Check for deleted files
  if echo "$INDEX" | command grep '^[MARCDU ]D ' &> /dev/null; then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$git_status"
  elif echo "$INDEX" | command grep '^D[ UM] ' &> /dev/null; then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$git_status"
  fi

  # Check for stashes
  if command git rev-parse --verify refs/stash >/dev/null 2>&1; then
    git_status="$SPACESHIP_GIT_STATUS_STASHED$git_status"
  fi


  # Check whether branch is ahead
  local is_ahead=false
  if echo "$INDEX" | command grep '^## [^ ]\+ .*ahead' &> /dev/null; then
    is_ahead=true
  fi

  # Check whether branch is behind
  local is_behind=false
  if echo "$INDEX" | command grep '^## [^ ]\+ .*behind' &> /dev/null; then
    is_behind=true
  fi

  # Check wheather branch has diverged
  if [[ "$is_ahead" == true && "$is_behind" == true ]]; then
    git_status="$SPACESHIP_GIT_STATUS_DIVERGED$git_status"
  else
    [[ "$is_ahead" == true ]] && git_status="$SPACESHIP_GIT_STATUS_AHEAD$git_status"
    [[ "$is_behind" == true ]] && git_status="$SPACESHIP_GIT_STATUS_BEHIND$git_status"
  fi

  # changed
  if [[ -n $git_status ]]; then
    echo "($git_status)"
  fi
}

spaceship_git_status
