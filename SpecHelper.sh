PodName="Noxmobi"
ThirdSDK="AppLovinSDK"
# 文件名
file_name=""
# 文件扩展名
file_extension="podspec"
# 文件所在文件夹当前路径
directory="$(pwd)"
# 文件完整路径
file_path=""

# 参数1: 路径；参数2: 文件后缀名
function getFileAtDirectory(){
    # 命令ls $1能获取文件夹下所有文件名的集合，相当于搞了一个数组
    for element in `ls $1`
    do
        dir_or_file=$1"/"$element
        # 如果是一个文件夹
        if [ -d $dir_or_file ]
        then
            # 继续递归调用
            getFileAtDirectory $dir_or_file
        else
            # ${file##*.} 删掉最后一个 . 及其左边的字符串
            file_extension=${dir_or_file##*.}
            if [[ $file_extension == $2 ]]; then
#                echo "$dir_or_file 是 $2 文件\n"
                file_path=$dir_or_file
                file_name=$element
            fi
        fi
    done
}

getFileAtDirectory $directory $file_extension

podspec_version=""
function latestSpecVersion() {
    while read my_line
    do
        # 查找到包含的内容，正则表达式获取以 spec.version 开头的内容
        result=$(echo ${my_line} | grep "^spec.version")
        if [[ "$result" != "" ]]
        then
#               echo "\n ${my_line} 包含 spec.version"
               # 分割字符串，是变量名称，不是变量的值; 前面的空格表示分割的字符，后面的空格不可省略
            array=(${result// / })
            # 数组长度
            count=${#array[@]}
            # 获取最后一个元素内容
            version=${array[count - 1]}
            # 去掉 '
            version=${version//\'/}
            podspec_version=$version
        fi
    # 这个就是在指定文件
    done < $file_path
#    echo "最新podspec_version="$podspec_version"\n"
}

#echo "打印一下最新版本号\n"
latestSpecVersion


# 读取plist中的版本号
targetVer=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" ./$PodName.framework/Info.plist)

function changeSpecVersion() {
    # 读取
    while read line
    do
        regular="^spec.version"
        if [[ "$line" =~ $regular ]];then
#            echo "File:${line}\n"
            sed -i "" "s/${line}/spec.version      = \"$targetVer\"/g" $file_path
        fi
        regular2="^spec.dependency"
        if [[ "$line" =~ $regular2 ]];then
            sed -i "" "s/${line}/spec.version      = \"$targetVer\"/g" $file_path
        fi
    done < $file_path
}

echo "🔥准备修改podspec: $podspec_version -> \"$targetVer\", 是否继续(y/n)\n"
read flag
if [[ "$flag" != "y" ]]
then
    exit 101
fi
changeSpecVersion
latestSpecVersion
echo "🔥修改结果:$podspec_version\n"

# 再修改一下这玩意
# spec.dependency "Google-Mobile-Ads-SDK", "8.5.0"
 
