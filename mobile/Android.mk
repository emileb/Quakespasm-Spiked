LOCAL_PATH:= $(call my-dir)/../Quake/

include $(CLEAR_VARS)

LOCAL_MODULE := quakespasm-spiked

LOCAL_CFLAGS := -DQUAKESPASM_SPIKED  -DUSE_ZLIB -DUSE_CODEC_VORBIS -DUSE_CODEC_MP3 -DDO_USERDIRS=1 -DENGINE_NAME=\"quakespasm\" -DUSE_SDL2 -DNO_SDL_CONFIG -DHAVE_JWZGLES

LOCAL_C_INCLUDES :=     $(SDL_INCLUDE_PATHS)  \
                        $(TOP_DIR) \
                        $(TOP_DIR)/gl4es/include \
                        $(TOP_DIR)/MobileTouchControls \
                        $(TOP_DIR)/AudioLibs_OpenTouch/liboggvorbis/include \
                        $(TOP_DIR)/AudioLibs_OpenTouch/libmpg123 \
                         $(TOP_DIR)/AudioLibs_OpenTouch/libmad \
                        $(TOP_DIR)/Clibs_OpenTouch \
                        $(TOP_DIR)/Clibs_OpenTouch/quake \


MUSIC_OBJS := \
        bgmusic.o \
       	snd_codec.o \
       	snd_flac.o \
       	snd_wave.o \
       	snd_vorbis.o \
       	snd_opus.o \
       	snd_mp3tag.o \
       	snd_mpg123.o \
       	snd_mikmod.o \
       	snd_xmp.o \
       	snd_umx.o


COMOBJ_SND := snd_voip.o snd_dma.o snd_mix.o snd_mem.o $(MUSIC_OBJS)
SYSOBJ_SND := snd_sdl.o
SYSOBJ_CDA := cd_sdl.o
SYSOBJ_INPUT := in_sdl.o
SYSOBJ_GL_VID:= gl_vidsdl.o
SYSOBJ_NET := net_bsd.o net_udp.o
SYSOBJ_SYS := pl_linux.o sys_sdl_unix.o
SYSOBJ_MAIN:= main_sdl.o
SYSOBJ_RES :=

GLOBJS = \
	gl_refrag.o \
	gl_rlight.o \
	gl_rmain.o \
	gl_fog.o \
	gl_rmisc.o \
	r_part.o \
	r_part_fte.o \
	r_world.o \
	gl_screen.o \
	gl_sky.o \
	gl_warp.o \
	$(SYSOBJ_GL_VID) \
	gl_draw.o \
	image.o \
	gl_texmgr.o \
	gl_mesh.o \
	r_sprite.o \
	r_alias.o \
	r_brush.o \
	gl_model.o

OBJS := strlcat.o \
	strlcpy.o \
	$(GLOBJS) \
	$(SYSOBJ_INPUT) \
	$(COMOBJ_SND) \
	$(SYSOBJ_SND) \
	$(SYSOBJ_CDA) \
	$(SYSOBJ_NET) \
	net_dgrm.o \
	mdfour.o \
	net_loop.o \
	net_main.o \
	chase.o \
	cl_demo.o \
	cl_input.o \
	cl_main.o \
	cl_parse.o \
	cl_tent.o \
	console.o \
	keys.o \
	menu.o \
	sbar.o \
	view.o \
	wad.o \
	cmd.o \
	common.o \
	fs_zip.o \
	crc.o \
	cvar.o \
	cfgfile.o \
	host.o \
	host_cmd.o \
	mathlib.o \
	pr_cmds.o \
	pr_ext.o \
	pr_edict.o \
	pr_exec.o \
	sv_main.o \
	sv_move.o \
	sv_phys.o \
	sv_user.o \
	world.o \
	zone.o \
	pmove.o \
	pmovetst.c \
	$(SYSOBJ_SYS) $(SYSOBJ_MAIN) $(SYSOBJ_RES)



LOCAL_SRC_FILES :=  $(OBJS:.o=.c) \
                    ../mobile/game_interface.c \
                    ../../../Clibs_OpenTouch/quake/android_jni.cpp \
                    ../../../Clibs_OpenTouch/quake/touch_interface.cpp \
                    ../../../Clibs_OpenTouch/touch_interface_base.cpp \


LOCAL_LDLIBS := -lEGL -ldl -llog -lz
LOCAL_STATIC_LIBRARIES := sigc libzip libpng logwritter  mpg123 ifaddrs mad
LOCAL_SHARED_LIBRARIES := touchcontrols SDL2 SDL2_mixer core_shared GL4ES saffal

include $(BUILD_SHARED_LIBRARY)



include 
