if (${env:GITHUB_WORKSPACE} -eq ${null}) {
  ${env:GITHUB_WORKSPACE}=${pwd}
}

cmake -E make_directory ${env:GITHUB_WORKSPACE}/build

pushd ${env:GITHUB_WORKSPACE}/build
	cmake -DVCPKG_VERBOSE=ON -DVCPKG_INSTALL_OPTIONS="--debug" -DCMAKE_TOOLCHAIN_FILE="${env:GITHUB_WORKSPACE}/vcpkg/scripts/buildsystems/vcpkg.cmake" ..
popd