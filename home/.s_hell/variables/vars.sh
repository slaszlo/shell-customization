# Workplace
export S_WORKPLACE="${HOME}/work"

# Custom clang
export S_CLANG_PATH="/usr/local/opt/llvm"
export LLVM="${S_CLANG_PATH}"
export S_CLANG_BIN="${S_CLANG_PATH}/bin"

## Update system vars with custom clang
export PATH="${S_CLANG_BIN}:${PATH}"
export CC="${S_CLANG_BIN}/clang"
export CXX="${S_CLANG_BIN}/clang++"

# Set localy installed softwares related variables
export S_LOCAL="${S_WORKPLACE}/local"
export S_L_BIN="${S_LOCAL}/bin"
export S_L_SBIN="${S_LOCAL}/sbin"

# MacOS related stuffs
if [[ $(uname -s) == "Darwin" ]] then
    SDKROOT=$(xcrun --show-sdk-path)
    export SDKROOT

    MACOSX_DEPLOYMENT_TARGET=$(xcrun --show-sdk-version)
    export MACOSX_DEPLOYMENT_TARGET
fi