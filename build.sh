BUILD_DIR=$1
MANIFEST_GIT_URL=$2
MANIFEST_GIT_BRANCH=$3
U_BOOT_BUILD_TARGET=$4

mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}
repo --trace init -u ${MANIFEST_GIT_URL} -b ${MANIFEST_GIT_BRANCH} --depth=1
repo --trace sync -c -j4
tools/bazel run //u-boot:${U_BOOT_BUILD_TARGET}_dist -- --dist_dir=${BUILD_DIR}/out/dist/${U_BOOT_BUILD_TARGET}
tools/bazel shutdown
