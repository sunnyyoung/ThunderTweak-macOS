APPPATH=/Applications/Thunder.app
FILEPATH=/Applications/Thunder.app/Contents/MacOS
FILENAME=Thunder
TWEAKFILE=ThunderTweak.m
DYLIBFILE=ThunderTweak.dylib

build::
	clang -dynamiclib ./${TWEAKFILE} -fobjc-link-runtime -current_version 1.0 -compatibility_version 1.0 -o ./${DYLIBFILE}

debug::
	make clean
	make build
	DYLD_INSERT_LIBRARIES=./${DYLIBFILE} ${FILEPATH}/${FILENAME} &

install::
	@if ! [ -f "${FILEPATH}/${FILENAME}" ]; then\
		echo "Can not find the ${FILENAME}.";\
		exit 1;\
	fi
	@if ! [ -f "./${DYLIBFILE}" ]; then\
		echo "Can not find the dylib file, please build first.";\
		exit 1;\
	fi

	@if [ -d "${APPPATH}/Contents/Bundles/Thunder Store.app" ]; then\
		mv ${APPPATH}/Contents/Bundles/Thunder\ Store.app ${APPPATH}/Contents/Bundles/Thunder\ Store;\
		echo "Remove Thunder Store.app successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/Bundles/XLPlayer.app" ]; then\
		mv ${APPPATH}/Contents/Bundles/XLPlayer.app ${APPPATH}/Contents/Bundles/XLPlayer;\
		echo "Remove XLPlayer.app successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/bbassistant.bundle" ]; then\
		mv ${APPPATH}/Contents/PlugIns/bbassistant.bundle ${APPPATH}/Contents/PlugIns/bbassistant.bak;\
		echo "Remove bbassistant.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/bottomadvertising.bundle" ]; then\
		mv ${APPPATH}/Contents/PlugIns/bottomadvertising.bundle ${APPPATH}/Contents/PlugIns/bottomadvertising.bak;\
		echo "Remove bottomadvertising.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/myvip.bundle" ]; then\
		mv ${APPPATH}/Contents/PlugIns/myvip.bundle ${APPPATH}/Contents/PlugIns/myvip.bak;\
		echo "Remove myvip.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/playgame.bundle" ]; then\
		mv ${APPPATH}/Contents/PlugIns/playgame.bundle ${APPPATH}/Contents/PlugIns/playgame.bak;\
		echo "Remove playgame.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/searchresource.bundle" ]; then\
		mv ${APPPATH}/Contents/PlugIns/searchresource.bundle ${APPPATH}/Contents/PlugIns/searchresource.bak;\
		echo "Remove searchresource.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/subtitle.bundle" ]; then\
		mv ${APPPATH}/Contents/PlugIns/subtitle.bundle ${APPPATH}/Contents/PlugIns/subtitle.bak;\
		echo "Remove subtitle.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/thunderstore.bundle" ]; then\
		mv ${APPPATH}/Contents/PlugIns/thunderstore.bundle ${APPPATH}/Contents/PlugIns/thunderstore.bak;\
		echo "Remove thunderstore.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/xiazaibao.bundle" ]; then\
		mv ${APPPATH}/Contents/PlugIns/xiazaibao.bundle ${APPPATH}/Contents/PlugIns/xiazaibao.bak;\
		echo "Remove xiazaibao.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/xlplayer.bundle" ]; then\
		mv ${APPPATH}/Contents/PlugIns/xlplayer.bundle ${APPPATH}/Contents/PlugIns/xlplayer.bak;\
		echo "Remove xlplayer.bundle successed!.";\
	fi

	@if [ -f "${FILEPATH}/${DYLIBFILE}" ]; then\
		cp ./${DYLIBFILE} ${FILEPATH}/${DYLIBFILE};\
		echo "Tweak file found! Replace with new tweak file successed!";\
	else \
		cp ${FILEPATH}/${FILENAME} ${FILEPATH}/${FILENAME}.bak;\
		cp ./${DYLIBFILE} ${FILEPATH}/${DYLIBFILE};\
		./insert_dylib @executable_path/${DYLIBFILE} ${FILEPATH}/${FILENAME} ${FILEPATH}/${FILENAME} --all-yes;\
		echo "Install successed!";\
	fi

uninstall::
	@if ! [ -f "${FILEPATH}/${FILENAME}" ]; then\
		echo "Can not find the ${FILENAME}.";\
		exit 1;\
	fi
	@if ! [ -f "${FILEPATH}/${FILENAME}.bak" ]; then\
		echo "Can not find the ${FILENAME} backup file.";\
		exit 1;\
	fi

	@if [ -d "${APPPATH}/Contents/Bundles/Thunder Store" ]; then\
		mv ${APPPATH}/Contents/Bundles/Thunder\ Store ${APPPATH}/Contents/Bundles/Thunder\ Store.app;\
		echo "Restore Thunder Store.app successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/Bundles/XLPlayer" ]; then\
		mv ${APPPATH}/Contents/Bundles/XLPlayer ${APPPATH}/Contents/Bundles/XLPlayer.app;\
		echo "Restore XLPlayer.app successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/bbassistant.bak" ]; then\
		mv ${APPPATH}/Contents/PlugIns/bbassistant.bak ${APPPATH}/Contents/PlugIns/bbassistant.bundle;\
		echo "Restore bbassistant.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/bottomadvertising.bak" ]; then\
		mv ${APPPATH}/Contents/PlugIns/bottomadvertising.bak ${APPPATH}/Contents/PlugIns/bottomadvertising.bundle;\
		echo "Restore bottomadvertising.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/myvip.bak" ]; then\
		mv ${APPPATH}/Contents/PlugIns/myvip.bak ${APPPATH}/Contents/PlugIns/myvip.bundle;\
		echo "Restore myvip.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/playgame.bak" ]; then\
		mv ${APPPATH}/Contents/PlugIns/playgame.bak ${APPPATH}/Contents/PlugIns/playgame.bundle;\
		echo "Restore playgame.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/searchresource.bak" ]; then\
		mv ${APPPATH}/Contents/PlugIns/searchresource.bak ${APPPATH}/Contents/PlugIns/searchresource.bundle;\
		echo "Restore searchresource.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/subtitle.bak" ]; then\
		mv ${APPPATH}/Contents/PlugIns/subtitle.bak ${APPPATH}/Contents/PlugIns/subtitle.bundle;\
		echo "Restore subtitle.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/thunderstore.bak" ]; then\
		mv ${APPPATH}/Contents/PlugIns/thunderstore.bak ${APPPATH}/Contents/PlugIns/thunderstore.bundle;\
		echo "Restore thunderstore.bundle successed!.";\
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/xiazaibao.bak" ]; then\
		mv ${APPPATH}/Contents/PlugIns/xiazaibao.bak ${APPPATH}/Contents/PlugIns/xiazaibao.bundle;\
		echo "Restore xiazaibao.bundle successed!.";\d
	fi
	@if [ -d "${APPPATH}/Contents/PlugIns/xlplayer.bak" ]; then\
		mv ${APPPATH}/Contents/PlugIns/xlplayer.bak ${APPPATH}/Contents/PlugIns/xlplayer.bundle;\
		echo "Restore xlplayer.bundle successed!.";\
	fi

	@rm -rf ${FILEPATH}/${DYLIBFILE};
	@mv ${FILEPATH}/${FILENAME}.bak ${FILEPATH}/${FILENAME};
	@echo "Uninstall successed";

clean::
	rm -rf ./${DYLIBFILE}
