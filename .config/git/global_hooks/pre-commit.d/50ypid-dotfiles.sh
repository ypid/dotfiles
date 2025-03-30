#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2025 Robin Schneider <ypid@riseup.net>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

function main() {
    # Deny to commit if repo uses pre-commit.com but hooks are not installed:
    # It should be implemented as assert. It should not run pre-commit hooks by
    # default without consent for security reasons. Manual install per project
    # is the preferred interface to achieve this.
    #
    # LLM prompt: I want to make sure that if a git repo is using
    #   pre-commit.com, that I must have the hooks installed otherwise `git
    #   commit` or commit via a GUI would fail. How can I achieve this?
    # GPT-4o mini answer was not useful.
    #
    # Pro `git config core.hooksPath`:
    # * Works regardless of how git commit is done: GUI, CLI (alias).
    # * Installing can be done with `GIT_CONFIG=/dev/null pre-commit install`
    # * More flexible for possible future extensions that want to globally hook
    #   into git.
    # Contra `git config core.hooksPath`:
    # * `pre-commit install` is unsupported by pre-commit.com with
    #   core.hooksPath set:
    #   https://github.com/pre-commit/pre-commit/issues/1198#issuecomment-844017639
    # * It requires to store hooks in the global hooksPath directory that
    #   call the equivalent local hook in $GIT_DIR/hooks for all existing hooks
    #   to not break expected behavior.
    #   https://medium.com/@ripoche.b/using-global-pre-commit-hook-to-prevent-committing-unwanted-code-edbbf957ad12
    # * It allows to easily overwrite this protection/warning that hooks
    #   exist but I have not installed them when I don’t use my alias.
    #   I am so used to using my alias that this will not happen by accident.
    if [ -e '.pre-commit-config.yaml' ]; then
        if ! grep --fixed-strings --quiet 'https://pre-commit.com' "$(git rev-parse --git-dir)/hooks/pre-commit"; then
            echo 'Install pre-commit.com hooks!'
            exit 1
        fi
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    PS4='+ $(date --rfc-3339=seconds), ${BASH_SOURCE-}:${LINENO-}: '
    export PS4
    trap 'echo Unhandled error at ${BASH_SOURCE-}:${LINENO-} caused exit with code $?. >&2' ERR
    set -o nounset -o pipefail -o errexit -o errtrace

    main "$@"
fi
