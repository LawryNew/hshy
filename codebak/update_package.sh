#!/bin/bash

time_now=`date +"%Y%m%d%H%M"`
dir_backup="/data/backup/"
dir_php="/data/nginx/html"
dir_pkg="/data/zjh_update/php_package"

#更新包文件
update_package="$1"

#需要更新PHP工程名
game="$2"
#打包方式
game_type="$3"

echo "${update_package}" >> ${dir_pkg}/php.txt
[ -z "${game}" ] && echo "请输入工程名作为第一个参数" && exit 2
package_name=`tail -1 ${dir_pkg}/php.txt`
#cp -r ${dir_php}/${game} ${dir_backup}/${time_now}/
cd ${dir_php}
zip -r ${game}_${time_now}.zip  ${game} -x "${game}/storage/*" -x "${game}/.git/*" &>/dev/null 
mkdir -p ${dir_backup}/${game} && mv ${dir_php}/${game}_${time_now}.zip   ${dir_backup}/${game}/ 
##move to bak_path

[ $? == 0 ] && echo "backup OK" && sleep 3
if [ ${game_type} = "zip" ];
then
        unzip ${dir_pkg}/${package_name} -d ${dir_php}
else
        tar -zxf ${dir_pkg}/${package_name} -C ${dir_php}
fi
[ $? == 0 ] && echo "update OK" 

if [ "${game}" == "message" ];then
	sed -i "s/test.hxapi.com/api.musky880.com:38080/g" ${dir_php}/${game}/index.html
else
	echo "${game} is not message"
fi
mv ${dir_pkg}/${update_package} ${dir_pkg}/history/

