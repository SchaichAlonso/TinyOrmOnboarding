if (${env:GITHUB_WORKSPACE} -eq ${null}) {
  ${env:GITHUB_WORKSPACE}=${pwd}
}

if (${env:BUILD_TYPE} -eq ${null}) {
  ${env:BUILD_TYPE}="debug"
}

$vcpkgPrefix="${env:GITHUB_WORKSPACE}/build/vcpkg_installed/x64-windows/"
if ($env:BUILD_TYPE -eq "Debug") {
	$vcpkgPrefix="${vcpkgPrefix}/debug"
}

${env:PATH}="${vcpkgPrefix}/bin;${env:PATH}"
${env:QT_PLUGIN_PATH}="${vcpkgPrefix}/Qt6/plugins"
cd "${env:GITHUB_WORKSPACE}/build"
& "${env:GITHUB_WORKSPACE}/build/${env:BUILD_TYPE}/MyTest" -junitxml > "${env:GITHUB_WORKSPACE}/build/result.xml"
#ctest --test-dir "${env:GITHUB_WORKSPACE}/build" -C "${env:BUILD_TYPE}" --output-junit "${env:GITHUB_WORKSPACE}/build/result.xml"
