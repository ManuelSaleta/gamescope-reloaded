# Variables
BIN_DIR      := $(HOME)/.local/bin
ENV_DIR      := $(HOME)/.config/environment.d
CONF_FILE    := $(ENV_DIR)/gaming.conf
SCRIPT_NAME  := gscope
SETUP_SCRIPT := setup_gaming_env.sh

.PHONY: all setup install clean help

# Default target when you just run 'make'
all: setup install

help:
	@echo "Available commands:"
	@echo "  make setup   - Run the one-time gaming.conf environment generator"
	@echo "  make install - Copy the 'gscope' launcher to your local bin directory"
	@echo "  make all     - Run both setup and install (default)"
	@echo "  make clean   - Remove the installed binaries and configs file"

setup:
	@echo "==> Configuring system environment variables..."
	@if [ -f ./$(SETUP_SCRIPT) ]; then \
		chmod +x ./$(SETUP_SCRIPT); \
		./$(SETUP_SCRIPT); \
	else \
		echo "ERROR: $(SETUP_SCRIPT) not found in current directory."; \
		exit 1; \
	fi

install:
	@echo "==> Installing '$(SCRIPT_NAME)' launcher to $(BIN_DIR)..."
	@mkdir -p $(BIN_DIR)
	@if [ -f ./$(SCRIPT_NAME) ]; then \
		cp ./$(SCRIPT_NAME) $(BIN_DIR)/$(SCRIPT_NAME); \
		chmod 755 $(BIN_DIR)/$(SCRIPT_NAME); \
		echo "Success! '$(SCRIPT_NAME)' is now installed."; \
		echo "Make sure '$(BIN_DIR)' is in your \$$PATH."; \
	else \
		echo "ERROR: Code file '$(SCRIPT_NAME)' not found in current directory."; \
		exit 1; \
	fi

clean:
	@echo "==> Uninstalling components..."
	rm -f $(BIN_DIR)/$(SCRIPT_NAME)
	rm -f $(CONF_FILE)
	@echo "Clean complete."