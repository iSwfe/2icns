WORK_PATH=${0%/*}
cd $WORK_PATH

INPUT=$1
temp=${1##*/}
INPUT_FILE_NAME=${temp%.*}
OUTPUT_FOLDER=Result
OUT=$WORK_PATH/$OUTPUT_FOLDER/$INPUT_FILE_NAME.icns

if [ -z "$INPUT" ] || [ -z "$OUT" ];then
	echo "[error]:please input png filename and out filename!"
	exit
fi

if [ -d "icons.iconset" ];then
	rm -rf icons.iconset
fi
echo "[info]:create dir icons.iconset"
mkdir icons.iconset

if [ ! -d "$OUTPUT_FOLDER" ];then
	mkdir $OUTPUT_FOLDER
fi
 
sips -z 16 16		"$INPUT" --out icons.iconset/icon_16x16.png
sips -z 32 32		"$INPUT" --out icons.iconset/icon_16x16@2x.png
sips -z 32 32		"$INPUT" --out icons.iconset/icon_32x32.png
sips -z 64 64		"$INPUT" --out icons.iconset/icon_32x32@2x.png
sips -z 64 64		"$INPUT" --out icons.iconset/icon_64x64.png
sips -z 128 128		"$INPUT" --out icons.iconset/icon_64x64@2x.png
sips -z 128 128		"$INPUT" --out icons.iconset/icon_128x128.png
sips -z 256 256		"$INPUT" --out icons.iconset/icon_128x128@2x.png
sips -z 256 256		"$INPUT" --out icons.iconset/icon_256x256.png
sips -z 512 512		"$INPUT" --out icons.iconset/icon_256x256@2x.png
sips -z 512 512		"$INPUT" --out icons.iconset/icon_512x512.png
sips -z 1024 1024	"$INPUT" --out icons.iconset/icon_512x512@2x.png
iconutil -c icns icons.iconset -o "$OUT"
rm -rf icons.iconset
echo "[info]:complated!"
