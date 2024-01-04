# Makefile for Xcode project CustCalc with scheme CustomCalc

# Configuration
CONFIGURATION = Debug

# Xcode build command
XCODEBUILD = xcodebuild

# Path to the .xcodeproj file
PROJECT_FILE = CustCalc.xcodeproj

# Target name
TARGET_NAME = CustCalc

# Build directory
BUILD_DIR = build

.PHONY: all clean

all:
	$(XCODEBUILD) -project $(PROJECT_FILE) -target $(TARGET_NAME) -configuration $(CONFIGURATION) build
	@mkdir ./Payload
	@cp -r ./build/Debug-iphoneos/CustCalc.app ./Payload
	@zip -r custcalc.tipa ./Payload
	@rm -rf ./Payload
	@rm -rf ./build

clean:
	$(XCODEBUILD) -project $(PROJECT_FILE) -target $(TARGET_NAME) -configuration $(CONFIGURATION) clean
