function fish_prompt -d "Write the left-side prompt"
	#set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# First four letters of username
	set_color $fish_color_user
	printf '%s ' (echo -n (echo $USER | cut -c1-4))

	# PWD
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal

	printf '%s' (__fish_git_prompt)

	# Appends a '*' to prompt if there are new or modified files
	# Appends 🡑 if the local repo is ahead of the remote
	# Appends 🡓 if the local repo is behind the remote
	# Check difference between plumbing and porcelain Git commands
	# http://stackoverflow.com/questions/2657935/checking-for-a-dirty-index-or-untracked-files-with-git
	set -l git_is_dirty (git status --porcelain 2>/dev/null | grep "^." --count)
	if test $git_is_dirty -gt 0
		echo -n '*'
	end

	set -l git_is_ahead (git status 2>/dev/null | grep 'branch is ahead of' --count)
	set -l git_is_behind (git status 2>/dev/null | grep 'branch is behind' --count)
	if test $git_is_ahead -gt 0
		set_color -o 3D1
		echo -n '🡑'
		set_color normal
	else if test $git_is_behind -gt 0 # Case hasn't been tested
		set_color $fish_color_error
		echo -n '🡓'
		set_color normal
	end
	echo -n ' '

	# Different prompts for root or standard user
	if test $USER = 'root'
		echo -n '# '
	else
		echo -n '> '
	end

	set_color normal
end
