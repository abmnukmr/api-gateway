#!/bin/bash

# Set target path
CONTROLLER_PATH="./src/main/java/com/abmnu/api_gateway/HelloController.java"

# Make sure the target directory exists
TARGET_DIR=$(dirname "$CONTROLLER_PATH")
if [ ! -d "$TARGET_DIR" ]; then
  echo "❌ Target directory does not exist: $TARGET_DIR"
  exit 1
fi

# Create the controller Java file
cat << 'EOF' > "$CONTROLLER_PATH"
package com.abmnu.api_gateway;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/api/hello")
    public String sayHello() {
        return "Hello from API Gateway!";
    }
}
EOF

# Confirm creation
if [ -f "$CONTROLLER_PATH" ]; then
    echo "✅ HelloController.java created at: $CONTROLLER_PATH"
else
    echo "❌ Failed to create HelloController.java"
fi
