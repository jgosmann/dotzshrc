case `uname` in
    *Darwin*)
        export ARDUINO_DIR='/Applications/Arduino.app/Contents/Resources/Java'
        export ARDMK_DIR='~/bin/Arduino-Makefile'
        path=($path ~/bin/Arduino-Makefile/bin)
        ;;
esac

