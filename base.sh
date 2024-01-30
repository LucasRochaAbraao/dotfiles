
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
PURPLE='\e[35m'
CYAN='\e[36m'
GRAY='\e[37m'
BOLD='\e[1m'
UNDER='\e[4m'
OK_CODE=0
ERROR_CODE=1
NC='\e[0m' # No Color


echo_good() {
    echo -e "${GREEN}[OK]${NC} $1"
    echo ""
}

echo_bad() {
    echo -e "${RED}[ERROR]${NC} $1"
    echo ""
}

echo_warn() {
    echo -e "${YELLOW}[!]${NC} $1"
}

echo_info() {
    echo -e "${PURPLE}#${NC} $1"
}

echo_header() {
    echo -e "${PURPLE}-->${NC} ${GRAY}${BOLD}${UNDER}$1${NC}"
    echo ""
}

print_horizontal_line() {
    printf "%s\n" "----------------------------------------"
}

is_package_installed() {
    local cmd="$1"
    if command -v $cmd &> /dev/null; then
        echo_info "$cmd is already installed."
        return $OK_CODE
    fi
    return $ERROR_CODE
}

install_package() {
    local package=$1

    if ! is_package_installed "$package"; then
        echo_info "Installing $package."
        sudo apt install -y "$package" > /dev/null 2>&1
    fi
}

check_deps() {
    local missing_deps=()

    for dep in "$@"; do
        if ! is_package_installed "$dep"; then
        missing_deps+=("$dep")
        fi
    done

    if [ ${#missing_deps[@]} -gt 0 ]; then
        echo_info "Installing missing dependencies: ${missing_deps[*]}"
        for dep in "${missing_deps[@]}"; do
            install_package "$dep"
        done
    fi
}

set_env_var() {
    local envvar_name="$1"
    local envvar_value="$2"
    local envvars_file="$HOME/.envvars"
    local bash_rc="$HOME/.bashrc"

    touch "$envvars_file"

    # make sure envvars_file is being sourced from .bashrc
    if ! grep -q "source $envvars_file" $bash_rc; then
        echo "source $envvars_file" >> $bash_rc
    fi

    # add the new env var to envvars_file so it's always sourced
    if ! grep -q "export ${envvar_name}=" $envvars_file; then
        echo "export ${envvar_name}=${envvar_value}" >> $envvars_file
    fi

    export "${envvar_name}=${envvar_value}"
}

set_alias() {
    local alias_name="$1"
    local alias_value="$2"
    local bash_aliases="$HOME/.bash_aliases"

    touch "$bash_aliases"

    if grep -q "^alias $alias_name=" $bash_aliases; then
        echo_info "'$alias_name' is already set."
    else
        echo_info "Setting new alias: '$alias_name=$alias_value'."
        echo "alias ${alias_name}='${alias_value}'" >> $bash_aliases
    fi

    source "$bash_aliases"
}


# gets the dotfile script's root path, strips it to just the path portion,
# cds to that path, uses pwd to return the abs path of the script.
# In the end, the context is unwound so it ends up back in the running directory,
# but with an environment variable DOTFILES containing the root path.

if [ -z "${DOTFILES}" ]; then
    export DOTFILES="$(cd "$(dirname "$0")" && pwd)"
fi