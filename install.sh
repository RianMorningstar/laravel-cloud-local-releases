#!/bin/bash
set -e

# Laravel Cloud Local Installation Script
# This script downloads and installs the latest version of Laravel Cloud Local

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
VERSION="${1:-latest}"
INSTALL_DIR="/usr/local/bin"
BINARY_NAME="lcl"
REPO="RianMorningstar/laravel-cloud-local-releases"

# Functions
print_error() {
    echo -e "${RED}Error: $1${NC}" >&2
}

print_success() {
    echo -e "${GREEN}$1${NC}"
}

print_info() {
    echo -e "${YELLOW}$1${NC}"
}

# Check if running as root
check_sudo() {
    if [ "$EUID" -eq 0 ]; then
        SUDO=""
    else
        SUDO="sudo"
        # Check if sudo is available
        if ! command -v sudo &> /dev/null; then
            print_error "This script requires sudo privileges. Please run as root or install sudo."
            exit 1
        fi
    fi
}

# Detect OS and architecture
detect_platform() {
    OS=$(uname -s | tr '[:upper:]' '[:lower:]')
    ARCH=$(uname -m)

    case "$OS" in
        linux)
            OS="linux"
            ;;
        darwin)
            OS="darwin"
            ;;
        *)
            print_error "Unsupported operating system: $OS"
            exit 1
            ;;
    esac

    case "$ARCH" in
        x86_64|amd64)
            ARCH="amd64"
            ;;
        aarch64|arm64)
            ARCH="arm64"
            ;;
        *)
            print_error "Unsupported architecture: $ARCH"
            exit 1
            ;;
    esac

    PLATFORM="${OS}-${ARCH}"
    print_info "Detected platform: $PLATFORM"
}

# Check dependencies
check_dependencies() {
    local missing_deps=()
    
    for cmd in curl tar; do
        if ! command -v $cmd &> /dev/null; then
            missing_deps+=($cmd)
        fi
    done
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        print_error "Missing required dependencies: ${missing_deps[*]}"
        print_info "Please install them and try again."
        exit 1
    fi
}

# Get download URL
get_download_url() {
    if [ "$VERSION" = "latest" ]; then
        print_info "Fetching latest release information..."
        DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | \
            grep "browser_download_url.*lcl-${PLATFORM}.tar.gz\"" | \
            cut -d '"' -f 4)
        
        if [ -z "$DOWNLOAD_URL" ]; then
            print_error "Could not find download URL for platform: $PLATFORM"
            print_info "Please check https://github.com/$REPO/releases for available downloads."
            exit 1
        fi
        
        # Extract version from URL for display
        VERSION=$(echo "$DOWNLOAD_URL" | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    else
        DOWNLOAD_URL="https://github.com/$REPO/releases/download/${VERSION}/lcl-${PLATFORM}.tar.gz"
    fi
    
    print_info "Download URL: $DOWNLOAD_URL"
}

# Download and install
download_and_install() {
    # Create temporary directory
    TEMP_DIR=$(mktemp -d)
    trap "rm -rf $TEMP_DIR" EXIT
    
    print_info "Downloading Laravel Cloud Local ${VERSION}..."
    
    # Download with progress bar
    if ! curl -L --progress-bar -o "$TEMP_DIR/lcl.tar.gz" "$DOWNLOAD_URL"; then
        print_error "Failed to download Laravel Cloud Local"
        exit 1
    fi
    
    print_info "Extracting archive..."
    if ! tar -xzf "$TEMP_DIR/lcl.tar.gz" -C "$TEMP_DIR"; then
        print_error "Failed to extract archive"
        exit 1
    fi
    
    # Find the binary (it should be named lcl-${PLATFORM})
    BINARY_PATH="$TEMP_DIR/lcl-${PLATFORM}"
    if [ ! -f "$BINARY_PATH" ]; then
        print_error "Binary not found in archive: lcl-${PLATFORM}"
        exit 1
    fi
    
    print_info "Installing to $INSTALL_DIR/$BINARY_NAME..."
    
    # Move binary to installation directory
    if ! $SUDO mv "$BINARY_PATH" "$INSTALL_DIR/$BINARY_NAME"; then
        print_error "Failed to install binary. You may need to run this script with sudo."
        exit 1
    fi
    
    # Make executable
    if ! $SUDO chmod +x "$INSTALL_DIR/$BINARY_NAME"; then
        print_error "Failed to make binary executable"
        exit 1
    fi
}

# Verify installation
verify_installation() {
    if command -v $BINARY_NAME &> /dev/null; then
        INSTALLED_VERSION=$($BINARY_NAME version 2>/dev/null || echo "unknown")
        print_success "✓ Laravel Cloud Local has been installed successfully!"
        print_info "  Version: $INSTALLED_VERSION"
        print_info "  Location: $(which $BINARY_NAME)"
        echo ""
        print_info "Get started:"
        echo "  1. Navigate to your Laravel project: cd /path/to/your/project"
        echo "  2. Start Laravel Cloud Local: lcl up"
        echo ""
        print_info "For help, run: lcl --help"
    else
        print_error "Installation verification failed"
        print_info "Please ensure $INSTALL_DIR is in your PATH"
        exit 1
    fi
}

# Main installation flow
main() {
    echo "======================================"
    echo "  Laravel Cloud Local Installer"
    echo "======================================"
    echo ""
    
    check_sudo
    detect_platform
    check_dependencies
    get_download_url
    download_and_install
    verify_installation
}

# Run main function
main "$@"