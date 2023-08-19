if (${env:GITHUB_WORKSPACE} -eq ${null}) {
  ${env:GITHUB_WORKSPACE}=${pwd}
}

if (${env:BUILD_TYPE} -eq ${null}) {
  ${env:BUILD_TYPE}="debug"
}

if (${env:VCPKG_TARGET_TRIPLET} -eq ${null}) {
  ${env:VCPKG_TARGET_TRIPLET}="x64-windows"
}

$vcpkgPrefix="${env:GITHUB_WORKSPACE}/build/vcpkg_installed/${env:VCPKG_TARGET_TRIPLET}/"
if ($env:BUILD_TYPE -eq "Debug") {
	$vcpkgPrefix="${vcpkgPrefix}/debug"
}

${env:PATH}="${vcpkgPrefix}/bin;${env:PATH}"
${env:QT_PLUGIN_PATH}="${vcpkgPrefix}/Qt6/plugins"
cd "${env:GITHUB_WORKSPACE}/build"
ctest --test-dir "${env:GITHUB_WORKSPACE}/build" -C "${env:BUILD_TYPE}" --output-junit "${env:GITHUB_WORKSPACE}/build/ctest.xml"
