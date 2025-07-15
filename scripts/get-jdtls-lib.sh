#!/bin/bash

mkdir -p ${HOME}/.local/share/nvim/jdtls

if [ ! -f "${HOME}/.local/share/nvim/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar" ]; then
  if wget -O /tmp/jdtls.tar.gz 'https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.48.0/jdt-language-server-1.48.0-202506271502.tar.gz'; then
    tar -xf /tmp/jdtls.tar.gz -C ${HOME}/.local/share/nvim/jdtls
  fi
fi

if git clone https://github.com/microsoft/java-debug.git ${HOME}/.local/share/nvim/java-debug; then
  cd ${HOME}/.local/share/nvim/java-debug
  ./mvnw clean install
  cd -
fi

