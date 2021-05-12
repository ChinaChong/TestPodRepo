#! /bin/bash

PodName="SinoTestPod01"

echo "\n🔥添加到暂存区 git add . ："
gitAddRes=`git add .`

echo "\n🔥提交 git commit："
gitCommitRes=`git commit -m v$srcVer`
echo "$gitCommitRes"

echo "\n🔥推送到远程 git push："
gitPushRes=`git push origin main`
echo "$gitPushRes"

echo "\n🔥打本地标签 git tag："
gitTagRes=`git tag $srcVer`

echo "\n🔥推送标签 git tag："
gitPushTagRes=`git push origin $srcVer`
echo "$gitPushTagRes"
