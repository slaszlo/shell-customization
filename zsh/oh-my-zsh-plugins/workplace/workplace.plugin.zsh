
if [ -z $S_WORKPLACE_PATH ]; then
	echo "Error: S_WROKPLACE_PATH is empty!"
	return 1
fi

local my_workplace=$S_WORKPLACE_PATH

local top_dir_indicators=(".git" ".vscode" ".project" ".cproject")

workplace ()
{
	#put input params into an array
	local -a input_params
	for word in "$@"; do
		input_params+=(${word})
	done

	case ${input_params[1]} in
		g|goto)
			target=${my_workplace}
			for folder in ${input_params[@]:1}; do
				target+="/${folder}"
			done
			cd ${target}
			;;

		p|project)
			case ${input_params[2]} in
				top|t)
					init="`pwd`"
					current=${init}
					while [[ ${current}  == "${my_workplace}"*  ]] {
						should_break=false
						for indicator in ${top_dir_indicators}; do
							if [[ -e "${current}/$indicator" ]] {
								# echo "${current}/$indicator \o/"
								should_break=true
								break
							}
						done

						if ( ${should_break} = true ) {
							break
						}

						cd ..
						current=`pwd`
					}

					if [[ "${current}/" == "${my_workplace}" ]] {
						cd "$init"
					}
					;;

				build|b)

					if [[ -n $TMUX ]] then
						local window_name=`tmux display-message -p '#W'`
						local window_id=`tmux display-message -p '#I'`
						tmux rename-window "building..."
					fi

					if [[ -e Makefile ]] then
						make
					elif [[ -x s_build.sh ]] then
						./s_build.sh
					fi

					if [[ -n $TMUX ]] then
						tmux rename-window -t $window_id $window_name
					fi
					;;
				*)
					echo "TBD"
					;;
			esac
			;;
		*)
			echo "Not implemented case!"
			;;
	esac
}

#compdef:
source "$(dirname  $0)/_workplace"

alias wp="workplace"
compdef _workplace workplace wp
