# perfect_vim
my vim configure

- 下载 vim配置文件：
git clone https://github.com/cc-droid/vim4linuxkernel.git 
 cd vim4linuxkernel/
 find . -name "*.git" | xargs rm -rf \};
 cp .* ../ -raf

- 安装 YouCompleteMe
 sudo apt-get install cmake
 sudo apt install python3.8-dev
 sudo apt-get install python3-distutils
 python3 install.py --clang-completer
 vim ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
参考.ycm_extra_conf.py flags格式添加linux内核include文件，
- 索引建立
 sudo apt-get install ctags
 sudo apt-get install cscope
        进入linux kernel根目录执行
 make tags ARCH=arm
 make cscope ARCH=arm
