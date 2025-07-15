# Makefile for OpenLib

.PHONY: all clean init build check-update help

# Default target
all: init build

# Initialize - download OpenList source code
init:
	@echo "Initializing OpenList source code..."
	cd scripts && chmod +x *.sh && ./init_openlist.sh

# Build OpenList
build:
	@echo "Building OpenList..."
	cd scripts && chmod +x *.sh && ./build_openlist.sh

# Check for updates
check-update:
	@echo "Checking for OpenList updates..."
	cd scripts && chmod +x *.sh && ./check_openlist_update.sh

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	cd scripts && chmod +x *.sh && ./clean.sh

# Help
help:
	@echo "Available targets:"
	@echo "  all          - Initialize and build (default)"
	@echo "  init         - Download OpenList source code"
	@echo "  build        - Build OpenList"
	@echo "  check-update - Check for OpenList updates"
	@echo "  clean        - Clean build artifacts"
	@echo "  help         - Show this help message"
