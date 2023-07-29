if (${env:GITHUB_WORKSPACE} -eq ${null}) {
  ${env:GITHUB_WORKSPACE}=${pwd}
}

if (${env:BUILD_TYPE} -eq ${null}) {
  ${env:BUILD_TYPE}="debug"
}

cmake `
	-B ${env:GITHUB_WORKSPACE}/build `
	-DVCPKG_VERBOSE=ON `
	-DVCPKG_INSTALL_OPTIONS="--debug" `
	-DCMAKE_TOOLCHAIN_FILE="${env:GITHUB_WORKSPACE}/vcpkg/scripts/buildsystems/vcpkg.cmake" `
	${env:GITHUB_WORKSPACE}

cmake --build ${env:GITHUB_WORKSPACE}/build --config ${env:BUILD_TYPE}