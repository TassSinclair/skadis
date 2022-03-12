BASE_NAME := ${basename ${FILE_NAME}}

all:
	for FILE_NAME in *.scad; do \
	    $(MAKE) FILE_NAME=$$FILE_NAME one ; \
	done

one:
	openscad -o $(BASE_NAME).stl ${FILE_NAME}
	openscad -o ${BASE_NAME}.png ${FILE_NAME}
	# convert ${BASE_NAME}.png -transparent "#ffffe5" -trim ${BASE_NAME}.png
	blender --background --python stl2glb.py -- ${BASE_NAME}.stl
