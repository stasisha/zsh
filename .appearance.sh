# shellcheck disable=SC2034
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(osx common-aliases gitfast sublime brew composer docker jsontools npm fzf)

typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# The list of segments shown on the left. Fill it with the most important segments.
typeset -ga POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    dir                     # current directory
    vcs                     # git status
    # =========================[ Line #2 ]=========================
    prompt_char             # prompt symbol
)

  # The list of segments shown on the right. Fill it with less important segments.
# Right prompt on the last prompt line (where you are typing your commands) gets
# automatically hidden when the input line reaches it. Right prompt above the
# last prompt line gets hidden if it would overlap with left prompt.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    command_execution_time  # duration of the last command
    status                  # exit code of the last command


    # anaconda                # conda environment (https://conda.io/)
    # pyenv                   # python environment (https://github.com/pyenv/pyenv)
    # nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
    # nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
    # nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
    # node_version          # node.js version
    # go_version            # golang version
    #kubecontext             # current kubernetes context (https://kubernetes.io/)
    docker_machine
    # background_jobs         # presence of background jobs
    #context                 # user@host
    # nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
    # =========================[ Line #2 ]=========================
    #newline
    # public_ip             # public IP address
    # battery               # internal battery
    time                  # current time
    # example               # example user-defined segment (see prompt_example function below)
)

# To disable default icons for all segments, set #POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=''.
#
# To enable default icons for all segments, don't define #POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION
# or set it to '${P9K_VISUAL_IDENTIFIER}'.
#
# To remove trailing space from all default icons, set #POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION
# to '${P9K_VISUAL_IDENTIFIER% }'.
#
# To enable default icons for one segment (e.g., dir), set
# POWERLEVEL9K_DIR_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'.
#
# To assign a specific icon to one segment (e.g., dir), set
# POWERLEVEL9K_DIR_VISUAL_IDENTIFIER_EXPANSION='⭐'.
#
# To assign a specific icon to a segment in a given state (e.g., dir in state NOT_WRITABLE),
# set POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'.
#
# Note: You can use $'\u2B50' instead of '⭐'. It's especially convenient when specifying
# icons that your text editor cannot render. Don't forget to put $ and use single quotes when
# defining icons via Unicode codepoints.
#
# Note: Many default icons cannot be displayed with system fonts. You'll need to install a
# capable font to use them. See POWERLEVEL9K_MODE below.
#typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'

# This option makes a difference only when default icons are enabled for all or some prompt
# segments (see POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION above). LOCK_ICON can be printed as
# $'\uE0A2', $'\uE138' or $'\uF023' depending on POWERLEVEL9K_MODE. The correct value of this
# parameter depends on the provider of the font your terminal is using.
#
#   Font Provider                    | POWERLEVEL9K_MODE
#   ---------------------------------+-------------------
#   Powerline                        | powerline
#   Font Awesome                     | awesome-fontconfig
#   Adobe Source Code Pro            | awesome-fontconfig
#   Source Code Pro                  | awesome-fontconfig
#   Awesome-Terminal Fonts (regular) | awesome-fontconfig
#   Awesome-Terminal Fonts (patched) | awesome-patched
#   Nerd Fonts                       | nerdfont-complete
#
# If this looks overwhelming, install a font from https://github.com/ryanoasis/nerd-fonts
# and set POWERLEVEL9K_MODE=nerdfont-complete. "Meslo LG S Regular Nerd Font Complete Mono" from
# https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo/S/Regular/complete is
# very good.
#typeset -g POWERLEVEL9K_MODE=powerline
typeset -g POWERLEVEL9K_MODE='nerdfont-complete'

# When set to true, icons appear before content on both sides of the prompt. When set
# to false, icons go after content. If empty or not set, icons go before content in the left
# prompt and after content in the right prompt.
#
# You can also override it for a specific segment:
#
#   POWERLEVEL9K_STATUS_ICON_BEFORE_CONTENT=false
#
# Or for a specific segment in specific state:
#
#   POWERLEVEL9K_DIR_NOT_WRITABLE_ICON_BEFORE_CONTENT=false
#typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=

# Add an empty line before each prompt.
#typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Connect left prompt lines with these symbols. You'll probably want to use the same color
# as POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND below.
#typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
#typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
#typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=
# Connect right prompt lines with these symbols.
#typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
#typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
#typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

# Filler between left and right prompt on the first prompt line. You can set it to ' ', '·' or
# '─'. The last two make it easier to see the alignment between left and right prompt and to
# separate prompt from command output. You might want to set POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
# for more compact prompt if using using this option.
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
  # The color of the filler. You'll probably want to match the color of POWERLEVEL9K_MULTILINE
  # ornaments defined above.
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=black
  # Start filler from the edge of the screen if there are no left segments on the first line.
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
  # End filler on the edge of the screen if there are no right segments on the first line.
  typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
fi

# Default background color.
typeset -g POWERLEVEL9K_BACKGROUND=236

# Separator between same-color segments on the left.
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%240F\uE0B1'
# Separator between same-color segments on the right.
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%240F\uE0B3'
# Separator between different-color segments on the left.
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
# Separator between different-color segments on the right.
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
# The right end of left prompt.
typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
# The left end of right prompt.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
# The left end of left prompt.
typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
# The right end of right prompt.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
# Left prompt terminator for lines without any segments.
typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

#################################[ os_icon: os identifier ]##################################
# Foreground color.
#typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=white
# Display this icon instead of the default.
# typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='⭐'

################################[ prompt_char: prompt symbol ]################################
# Transparent background.
typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
# Green prompt symbol if the last command succeeded.
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=black
# Red prompt symbol if the last command failed.
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=red
# Default prompt symbol.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
# Prompt symbol in command vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
# Prompt symbol in visual vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='Ⅴ'
# No line terminator if prompt_char is the last segment.
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
# No line introducer if prompt_char is the first segment.
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
# No surrounding whitespace.
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

##################################[ dir: current directory ]##################################
# Default current directory color.
typeset -g POWERLEVEL9K_DIR_FOREGROUND=green
# If directory is too long, shorten some of its segments to the shortest possible unique
# prefix. The shortened directory can be tab-completed to the original.
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
# Replace removed segment suffixes with this symbol.
typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=..
# Color of the shortened directory segments.
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=green
# Color of the anchor directory segments. Anchor segments are never shortened. The first
# segment is always an anchor.
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=green
# Display anchor directory segments in bold.
typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=false
# Don't shorten directories that contain files matching this pattern. They are anchors.
typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER='(.shorten_folder_marker|.bzr|CVS|.git|.hg|.svn|.terraform|.citc)'
# Don't shorten this many last directory segments. They are anchors.
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# Shorten directory if it's longer than this even if there is space for it. The value can
# be either absolute (e.g., '80') or a percentage of terminal width (e.g, '50%'). If empty,
# directory will be shortened only when prompt doesn't fit.
typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
# If set to true, embed a hyperlink into the directory. Useful for quickly
# opening a directory in the file manager simply by clicking the link.
# Can also be handy when the directory is shortened, as it allows you to see
# the full directory that was used in previous commands.
typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

# Enable special styling for non-writable directories.
typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true
# Show this icon when the current directory is not writable. Empty for no icon.
# typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'

# Custom prefix.
# typeset -g POWERLEVEL9K_DIR_PREFIX='%248Fin '

# POWERLEVEL9K_DIR_CLASSES allows you to specify custom icons for different directories.
# It must be an array with 3 * N elements. Each triplet consists of:
#
#   1. A pattern against which the current directory is matched. Matching is done with
#      extended_glob option enabled.
#   2. Directory class for the purpose of styling.
#   3. Icon.
#
# Triplets are tried in order. The first triplet whose pattern matches $PWD wins. If there
# are no matches, the directory will have no icon.
#
# Example:
#
#   typeset -g POWERLEVEL9K_DIR_CLASSES=(
#       '~/work(/*)#'  WORK     '(╯°□°）╯︵ ┻━┻'
#       '~(/*)#'       HOME     '⌂'
#       '*'            DEFAULT  '')
#
# With these settings, the current directory in the prompt may look like this:
#
#   (╯°□°）╯︵ ┻━┻ ~/work/projects/important/urgent
#
# Or like this:
#
#   ⌂ ~/best/powerlevel10k
#
# You can also set different colors for directories of different classes. Remember to override
# FOREGROUND, SHORTENED_FOREGROUND and ANCHOR_FOREGROUND for every directory class that you wish
# to have its own color.
#
#   typeset -g POWERLEVEL9K_DIR_WORK_FOREGROUND=12
#   typeset -g POWERLEVEL9K_DIR_WORK_SHORTENED_FOREGROUND=4
#   typeset -g POWERLEVEL9K_DIR_WORK_ANCHOR_FOREGROUND=39
#
#typeset -g POWERLEVEL9K_DIR_CLASSES=()

#####################################[ vcs: git status ]######################################
# Git status: feature:master#tag ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
# We are using parameters defined by the gitstatus plugin. See reference:
# https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
#local vcs=''
# 'feature' or '@72f5c8a' if not on a branch.
#vcs+='${${VCS_STATUS_LOCAL_BRANCH:+%[magenta]${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${VCS_STATUS_LOCAL_BRANCH//\%/%%}}'
#vcs+=':-%f@%[magenta]${VCS_STATUS_COMMIT[1,8]}}'
# ':master' if the tracking branch name differs from local branch.
#vcs+='${${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH}:+%f:%[magenta]${VCS_STATUS_REMOTE_BRANCH//\%/%%}}'
# '#tag' if on a tag.
#vcs+='${VCS_STATUS_TAG:+%f#%[magenta]${VCS_STATUS_TAG//\%/%%}}'
# ⇣42 if behind the remote.
#vcs+='${${VCS_STATUS_COMMITS_BEHIND:#0}:+ %[magenta]⇣${VCS_STATUS_COMMITS_BEHIND}}'
# ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
# If you want '⇣42 ⇡42' instead, replace '${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+ }' with ' '.
#vcs+='${${VCS_STATUS_COMMITS_AHEAD:#0}:+${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+ }%[magenta]⇡${VCS_STATUS_COMMITS_AHEAD}}'
# *42 if have stashes.
#vcs+='${${VCS_STATUS_STASHES:#0}:+ %[magenta]*${VCS_STATUS_STASHES}}'
# 'merge' if the repo is in an unusual state.
#vcs+='${VCS_STATUS_ACTION:+ %[red]${VCS_STATUS_ACTION//\%/%%}}'
# ~42 if have merge conflicts.
#vcs+='${${VCS_STATUS_NUM_CONFLICTED:#0}:+ %[red]~${VCS_STATUS_NUM_CONFLICTED}}'
# +42 if have staged changes.
#vcs+='${${VCS_STATUS_NUM_STAGED:#0}:+ %[yellow]+${VCS_STATUS_NUM_STAGED}}'
# !42 if have unstaged changes.
#vcs+='${${VCS_STATUS_NUM_UNSTAGED:#0}:+ %[yellow]!${VCS_STATUS_NUM_UNSTAGED}}'
# ?42 if have untracked files.
#vcs+='${${VCS_STATUS_NUM_UNTRACKED:#0}:+ %[magenta]?${VCS_STATUS_NUM_UNTRACKED}}'
# If P9K_CONTENT is not empty, leave it unchanged. It's either "loading" or from vcs_info.
#vcs="\${P9K_CONTENT:-$vcs}"

# Branch icon. Set this parameter to $'\uF126' for the popular Powerline branch icon.
#typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=

# Disable the default Git status formatting.
#typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
# Install our own Git status formatter.
#typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_CONTENT_EXPANSION=$vcs
# When Git status is being refreshed asynchronously, display the last known repo status in grey.
#typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION=${${vcs//\%f}//\%<->F}
typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=black
# Enable counters for staged, unstaged, etc.
#typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

# Custom icon.
#typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=
# Custom prefix.
# typeset -g POWERLEVEL9K_VCS_PREFIX='%248Fon '

# Show status of repositories of these types. You can add svn and/or hg if you are
# using them. If you do, your prompt may become slow even when your current directory
# isn't in an svn or hg reposotiry.
typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

# These settings are used for respositories other than Git or when gitstatusd fails and
# Powerlevel10k has to fall back to using vcs_info.
typeset -g POWERLEVEL9K_VCS_{CLEAN,MODIFIED,UNTRACKED}_FOREGROUND=magenta
#typeset -g POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=':'
#typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
#typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='⇣'
#typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='⇡'
#typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'
#typeset -g POWERLEVEL9K_VCS_TAG_ICON=$'%{\b#%}'
#typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=$'%{\b?%}'
#typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON=$'%{\b!%}'
#typeset -g POWERLEVEL9K_VCS_STAGED_ICON=$'%{\b+%}'

##########################[ status: exit code of the last command ]###########################
# Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
# style them independently from the regular OK and ERROR state.
typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

# Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
# it will signify success by turning green.
#typeset -g POWERLEVEL9K_STATUS_OK=false
#typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=green
#typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'

# Status when some part of a pipe command fails but the overall exit status is zero. It may look
# like this: 1|0.
typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=green
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'

# Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
# it will signify error by turning red.
typeset -g POWERLEVEL9K_STATUS_ERROR=false
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=red
typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='↵'

# Status when the last command was terminated by a signal.
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=red
# Use terse signal names: "INT" instead of "SIGINT(2)".
typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='↵'

# Status when some part of a pipe command fails and the overall exit status is also non-zero.
# It may look like this: 1|0.
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=red
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='↵'

###################[ command_execution_time: duration of the last command ]###################
# Background color.
# Show duration of the last command if takes longer than this many seconds.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
# Show this many fractional digits. Zero means round to seconds.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
# Execution time color.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=black
# Duration format: 1d 2h 3m 4s.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
# Custom icon.
#typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=
# Custom prefix.
# typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='%248Ftook '

#######################[ background_jobs: presence of background jobs ]#######################
# Don't show the number of background jobs.
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
# Background jobs color.
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=cyan
# Icon to show when there are background jobs.
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'

##########[ nordvpn: nordvpn connection status, linux only (https://nordvpn.com/) ]###########
# NordVPN connection indicator color.
typeset -g POWERLEVEL9K_NORDVPN_FOREGROUND=blue
# Hide NordVPN connection indicator when not connected.
typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_CONTENT_EXPANSION=
typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_VISUAL_IDENTIFIER_EXPANSION=
# Custom icon.
# typeset -g POWERLEVEL9K_NORDVPN_VISUAL_IDENTIFIER_EXPANSION='⭐'

####################################[ context: user@host ]####################################
# Default context color.
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=yellow
# Default context format: %n is username, %m is hostname.
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

# Context color when running with privileges.
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=yellow
# Context format when running with privileges: %n is username, %m is hostname.
typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'

# Don't show context unless running with privileges on in SSH.
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true

# Custom icon.
# typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION='⭐'
# Custom prefix.
# typeset -g POWERLEVEL9K_CONTEXT_PREFIX='%248Fwith '

###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###
# Python virtual environment color.
typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=cyan
# Don't show Python version next to the virtual environment name.
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
# Separate environment name from Python version only with a space.
typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=
# Custom icon.
# typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

#####################[ anaconda: conda environment (https://conda.io/) ]######################
# Anaconda environment color.
typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=cyan
# Don't show Python version next to the anaconda environment name.
typeset -g POWERLEVEL9K_ANACONDA_SHOW_PYTHON_VERSION=false
# Separate environment name from Python version only with a space.
typeset -g POWERLEVEL9K_ANACONDA_{LEFT,RIGHT}_DELIMITER=
# Custom icon.
# typeset -g POWERLEVEL9K_ANACONDA_VISUAL_IDENTIFIER_EXPANSION='⭐'

################[ pyenv: python environment (https://github.com/pyenv/pyenv) ]################
# Pyenv color.
typeset -g POWERLEVEL9K_PYENV_FOREGROUND=cyan
# Don't show the current Python version if it's the same as global.
typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
# Custom icon.
# typeset -g POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

##########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
# Nodenv color.
typeset -g POWERLEVEL9K_NODENV_FOREGROUND=green
# Don't show node version if it's the same as global: $(nodenv version-name) == $(nodenv global).
typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
# Custom icon.
# typeset -g POWERLEVEL9K_NODENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
# Nvm color.
typeset -g POWERLEVEL9K_NVM_FOREGROUND=green
# Custom icon.
# typeset -g POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

############[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]############
# Nodeenv color.
typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=green
# Don't show Node version next to the environment name.
typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
# Separate environment name from Node version only with a space.
typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=
# Custom icon.
# typeset -g POWERLEVEL9K_NODEENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

##############################[ node_version: node.js version ]###############################
# Node version color.
typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=green
# Show node version only when in a directory tree containing package.json.
typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
# Custom icon.
# typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

################################[ go_version: golang version ]################################
# Golang version color.
typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=cyan
# Custom icon.
# typeset -g POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

#############[ kubecontext: current kubernetes context (https://kubernetes.io/) ]#############
# Kubernetes context classes for the purpose of using different colors, icons and expansions with
# different contexts.
#
# POWERLEVEL9K_KUBECONTEXT_CLASSES is an array with even number of elements. The first element
# in each pair defines a pattern against which the current kubernetes context gets matched.
# More specifically, it's P9K_CONTENT prior to the application of context expansion (see below)
# that gets matched. If you unset all POWERLEVEL9K_KUBECONTEXT_*CONTENT_EXPANSION parameters,
# you'll see this value in your prompt. The second element of each pair in
# POWERLEVEL9K_KUBECONTEXT_CLASSES defines the context class. Patterns are tried in order. The
# first match wins.
#
# For example, if your current kubernetes context is "deathray-testing/default", its class is TEST
# because "deathray-testing/default" doesn't match the pattern '*prod*' but does match '*test*'.
#
# You can define different colors, icons and content expansions for different classes:
#
#   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_FOREGROUND=2
#   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
#   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
    # '*prod*'  PROD    # These values are examples that are unlikely
    # '*test*'  TEST    # to match your needs. Customize them as needed.
    '*'       DEFAULT)
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=magenta
# typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

# Use POWERLEVEL9K_KUBECONTEXT_CONTENT_EXPANSION to specify the content displayed by kubecontext
# segment.
#
# Within the expansion the following parameters are always available:
#
# - P9K_CONTENT                The content that would've been displayed if there was no content
#                              expansion defined.
# - P9K_KUBECONTEXT_NAME       The current context's name. Corresponds to column NAME in the
#                              output of `kubectl config get-contexts`.
# - P9K_KUBECONTEXT_CLUSTER    The current context's cluster. Corresponds to column CLUSTER in the
#                              output of `kubectl config get-contexts`.
# - P9K_KUBECONTEXT_NAMESPACE  The current context's namespace. Corresponds to column NAMESPACE
#                              in the output of `kubectl config get-contexts`. If there is no
#                              namespace, the parameter is set to "default".
#
# If the context points to GKE or EKS, the following extra parameters are available:
#
# - P9K_KUBECONTEXT_CLOUD_NAME     Either "gke" or "eks".
# - P9K_KUBECONTEXT_CLOUD_ACCOUNT  Account/project ID.
# - P9K_KUBECONTEXT_CLOUD_ZONE     Availability zone.
# - P9K_KUBECONTEXT_CLOUD_CLUSTER  Cluster.
#
# P9K_KUBECONTEXT_CLOUD_* parameters are derived from P9K_KUBECONTEXT_CLUSTER. For example,
# if P9K_KUBECONTEXT_CLUSTER is "gke_my-account_us-east1-a_my-cluster-01":
#
#   - P9K_KUBECONTEXT_CLOUD_NAME=gke
#   - P9K_KUBECONTEXT_CLOUD_ACCOUNT=my-account
#   - P9K_KUBECONTEXT_CLOUD_ZONE=us-east1-a
#   - P9K_KUBECONTEXT_CLOUD_CLUSTER=my-cluster-01
#
# If P9K_KUBECONTEXT_CLUSTER is "arn:aws:eks:us-east-1:123456789012:cluster/my-cluster-01":
#
#   - P9K_KUBECONTEXT_CLOUD_NAME=eks
#   - P9K_KUBECONTEXT_CLOUD_ACCOUNT=123456789012
#   - P9K_KUBECONTEXT_CLOUD_ZONE=us-east-1
#   - P9K_KUBECONTEXT_CLOUD_CLUSTER=my-cluster-01
#
# The expansion below will show P9K_KUBECONTEXT_CLOUD_CLUSTER if it's not empty and fall back
# to P9K_KUBECONTEXT_NAME. Parameter expansions are very flexible and fast, too. See reference:
# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion.
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'

# Custom prefix.
# typeset -g POWERLEVEL9K_KUBECONTEXT_PREFIX='%248Fat '

###############################[ public_ip: public IP address ]###############################
# Public IP color.
typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=black
# Custom icon.
# typeset -g POWERLEVEL9K_PUBLIC_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

####################################[ time: current time ]####################################
# Current time color.
typeset -g POWERLEVEL9K_TIME_FOREGROUND=black
# Format for the current time: 09:51:02. See `man 3 strftime`.
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
# If set to true, time will update when you hit enter. This way prompts for the past
# commands will contain the start times of their commands as opposed to the default
# behavior where they contain the end times of their preceding commands.
typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false
# Custom icon.
typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION=
# Custom prefix.
# typeset -g POWERLEVEL9K_TIME_PREFIX='%248Fat '

# User-defined prompt segments can be customized the same way as built-in segments.
typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND=208
typeset -g POWERLEVEL9K_EXAMPLE_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'