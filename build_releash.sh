function openGithubAppMacOS() {
    echo '检测到 macOS 系统，正在尝试打开 Github Desktop :'
    open -a /Applications/GitHub\ Desktop.app
}

echo '-------------------------- Build Begin ----------------------------'
flutter build web --no-sound-null-safety

echo 'move product into hornhuang.github.io'

cp -r build/web/. ../hornhuang.github.io

echo 'github于2021年8月13日不再支持密码验证，配置很麻烦，请直接用github desktop提交'

if [ $OSTYPE == darwin20 ]
then openGithubAppMacOS
fi

echo '-------------------------- Build Finish ---------------------------'

# cd ../hornhuang.github.io

# read -p "输入本次修改的描述：" commit_introduce
# git commit -m commit_introduce
# git push

# cd ../hornhuang_github_io
