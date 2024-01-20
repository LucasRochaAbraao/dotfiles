
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
    echo ""
}

echo_info() {
    echo -e "${PURPLE}#${NC} $1"
    echo ""
}

echo_header() {
    echo -e "${PURPLE}-->${NC} ${GRAY}${BOLD}${UNDER}$1${NC}"
    echo ""
}

print_horizontal_line() {
    echo ""
    printf "%s\n" "----------------------------------------"
}

is_package_installed() {
    if dpkg -l | grep -q "$1"; then
        echo_info "$package is already installed."
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


# gets the dotfile script's root path, strips it to just the path portion,
# cds to that path, uses pwd to return the abs path of the script.
# In the end, the context is unwound so it ends up back in the running directory,
# but with an environment variable DOTFILES containing the root path.
export DOTFILES="$(cd "$(dirname "$0")" && pwd)"