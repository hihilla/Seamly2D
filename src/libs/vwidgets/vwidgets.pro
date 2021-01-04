#-------------------------------------------------
#
# Project created by QtCreator 2015-06-15T15:24:19
#
#-------------------------------------------------

# File with common stuff for whole project
message("Entering vwidgets.pro")
include(../../../common.pri)
include(vwidgets.pri)
include(warnings.pri)

QT += widgets xml printsupport

# Name of the library
TARGET = vwidgets

# We want create a library
TEMPLATE = lib

CONFIG += \
    staticlib \# Making static library
    c++14 # We use C++14 standard

# Use out-of-source builds (shadow builds)
CONFIG -= debug_and_release debug_and_release_target

# Since Qt 5.4.0 the source code location is recorded only in debug builds.
# We need this information also in release builds. For this need define QT_MESSAGELOGCONTEXT.
DEFINES += QT_MESSAGELOGCONTEXT


# This is static library so no need in "make install"

# directory for executable file
DESTDIR = bin

# files created moc
MOC_DIR = moc

# objecs files
OBJECTS_DIR = obj

# Set using ccache. Function enable_ccache() defined in common.pri.
$$enable_ccache()

CONFIG(release, debug|release){
    # Release mode
    !*msvc*:CONFIG += silent

    !unix:*g++*{
        QMAKE_CXXFLAGS += -fno-omit-frame-pointer # Need for exchndl.dll
    }

    noDebugSymbols{ # For enable run qmake with CONFIG+=noDebugSymbols
        # do nothing
    } else {
        !macx:!*msvc*{
            # Turn on debug symbols in release mode on Unix systems.
            # On Mac OS X temporarily disabled. TODO: find way how to strip binary file.
            QMAKE_CXXFLAGS_RELEASE += -g -gdwarf-3
            QMAKE_CFLAGS_RELEASE += -g -gdwarf-3
            QMAKE_LFLAGS_RELEASE =
        }
    }
}

include (../libs.pri)
