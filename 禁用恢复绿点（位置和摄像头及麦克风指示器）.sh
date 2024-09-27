#!/system/bin/sh
(echo "\n  按下音量按钮\n   音量 + : 禁用绿点\n   音量 - : 恢复绿点\n";
while true;
do input="$(timeout 0.1 getevent -l|grep -Eo 'VOLUMEUP|VOLUMEDOWN'|head -n1)";
if [ "$input" = "VOLUMEUP" ];then 
echo "   已选定 : 禁用绿点\n";
su -c cmd device_config put privacy location_indicators_enabled false default
su -c cmd device_config put privacy camera_mic_icons_enabled false default
break;
elif [ "$input" = "VOLUMEDOWN" ];then 
echo "   已选定 : 恢复绿点\n";
su -c cmd device_config put privacy location_indicators_enabled true default
su -c cmd device_config put privacy camera_mic_icons_enabled true default
break;
fi;
done;)2>/dev/null