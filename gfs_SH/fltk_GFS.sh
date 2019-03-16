#! /bin/bash
GFS_Option=$1
if [ "${GFS_Option}" == "source" ]; then
    if [ ! -d "${GFS_Software_Source_Path}/software_tar" ]; then
        mkdir ${GFS_Software_Source_Path}/software_tar
    fi
    axel https://www.fltk.org/pub/fltk/1.3.4/fltk-1.3.4-2-source.tar.gz -o ${GFS_Software_Source_Path}/software_tar
    tar -xvf ${GFS_Software_Source_Path}/software_tar/fltk-1.3.4-2-source.tar.gz -C ${GFS_Software_Source_Path}
    echo "已将fltk的压缩包下载至${GFS_Software_Source_Path}/software_tar"
    echo "已将fltk的压缩包解压至${GFS_Software_Source_Path}"
fi
if [ "${GFS_Option}" == "configure" ]; then
    if [ ! -f "${GFS_Software_Source_Path}/fltk-1.3.4-2/configure" ]; then
        echo "文件${GFS_Software_Source_Path}/fltk-1.3.4-2/configure不存在"
        unset GFS_Software_Source_Path GFS_Option
        exit
    fi
    cd ${GFS_Software_Source_Path}/fltk-1.3.4-2
    while true ; do 
        read -p "请输入configure的参数[(s)tart,(q)uit,(h)elp]: " GFS_Buffer
        if [[ "${GFS_Buffer}" == "q" ]]; then
            break
        elif [[ "${GFS_Buffer}" == "h" ]]; then
            ./configure --help
        elif [[ "${GFS_Buffer}" == "s" ]]; then
            ./configure ${GFS_Configure_Option}
            break
        else
            GFS_Configure_Option="${GFS_Configure_Option} ${GFS_Buffer}"
        fi
    done
    unset GFS_Configure_Option GFS_Buffer
fi
if [ "${GFS_Option}" == "make" ]; then
    if [ ! -f "${GFS_Software_Source_Path}/fltk-1.3.4-2/Makefile" ]; then
        echo "文件${GFS_Software_Source_Path}/fltk-1.3.4-2/Makefile不存在"
        unset GFS_Option GFS_Software_Source_Path
        exit
    fi
    cd ${GFS_Software_Source_Path}/fltk-1.3.4-2
    while true; do
        read -p "请输入Makefile的参数[(s)tart,(q)uit]: " GFS_Buffer
        if [[ "${GFS_Buffer}" == "q" ]]; then
            break
        elif [[ "${GFS_Buffer}" == "s" ]]; then
            make ${GFS_Make_Option}
            break
        else
            GFS_Make_Option="${GFS_Make_Option} ${GFS_Buffer}"
        fi
    done
    unset GFS_Buffer GFS_Make_Option
fi
if [ "${GFS_Option}" == "makeclean" ]; then
    if [ ! -f "${GFS_Software_Source_Path}/fltk-1.3.4-2/Makefile" ]; then
        echo "文件${GFS_Software_Source_Path}/fltk-1.3.4-2/Makefile不存在"
        unset GFS_Option GFS_Software_Source_Path
        exit
    fi
    cd ${GFS_Software_Source_Path}/fltk-1.3.4-2
    make clean
fi
if [ "${GFS_Option}" == "uninstall" ]; then
    if [ ! -f "${GFS_Software_Source_Path}/fltk-1.3.4-2/Makefile" ]; then
        echo "文件${GFS_Software_Source_Path}/fltk-1.3.4-2/Makefile不存在"
        unset GFS_Option GFS_Software_Source_Path
        exit
    fi
    cd ${GFS_Software_Source_Path}/fltk-1.3.4-2
    make uninstall
fi
if [ "${GFS_Option}" == "install" ]; then
    if [ ! -f "${GFS_Software_Source_Path}/fltk-1.3.4-2/Makefile" ]; then
        echo "文件${GFS_Software_Source_Path}/fltk-1.3.4-2/Makefile不存在"
        unset GFS_Option GFS_Software_Source_Path
        exit
    fi
    cd ${GFS_Software_Source_Path}/fltk-1.3.4-2
    make install
fi
if [ "${GFS_Option}" == "cd" ]; then
    cd ${GFS_Software_Source_Path}/fltk-1.3.4-2
    while true; do
        read -p "请输入命令: " Command
        if [ "${Command}" == "exit" ]; then
            unset Command GFS_Option GFS_Software_Source_Path
            exit
        fi
        ${Command}
    done
fi
if [ "${GFS_Option}" == "remove" ]; then
    rm -r ${GFS_Software_Source_Path}/fltk-1.3.4-2
    rm ${GFS_Software_Source_Path}/software_tar/fltk-1.3.4-2-source.tar.gz
fi
unset GFS_Option
