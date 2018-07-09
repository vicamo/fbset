LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := fbset
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_CLASS := EXECUTABLES
intermediates:= $(local-intermediates-dir)
GEN := $(addprefix $(intermediates)/, \
    modes.tab.c \
    lex.yy.c \
)

$(intermediates)/modes.tab.c: PRIVATE_PATH := $(LOCAL_PATH)
$(intermediates)/modes.tab.c: PRIVATE_CUSTOM_TOOL = $(YACC) -o $@ $<
$(intermediates)/modes.tab.c: $(LOCAL_PATH)/modes.y
	$(transform-generated-source)

$(intermediates)/lex.yy.c: PRIVATE_PATH := $(LOCAL_PATH)
$(intermediates)/lex.yy.c: PRIVATE_CUSTOM_TOOL = $(LEX) -o $@ $<
$(intermediates)/lex.yy.c: $(LOCAL_PATH)/modes.l
	$(transform-generated-source)

LOCAL_GENERATED_SOURCES += $(GEN)

LOCAL_SRC_FILES := fbset.c

include $(BUILD_EXECUTABLE)
