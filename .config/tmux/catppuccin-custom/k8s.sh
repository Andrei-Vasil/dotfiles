show_k8s() { # This function name must match the module name!
  local index icon color text module

  index=$1 # This variable is used internally by the module loader in order to know the position of this module

  icon="$(  get_tmux_option "@catppuccin_k8s_icon"  "󱃾"           )"
  color="$( get_tmux_option "@catppuccin_k8s_color" "$thm_blue" )"
  text="$(  get_tmux_option "@catppuccin_k8s_text"  "#( ~/.scripts/get_cluster_name.sh )" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
