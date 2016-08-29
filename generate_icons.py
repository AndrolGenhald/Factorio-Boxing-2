#!/usr/bin/env python

import os, glob, zipfile, tempfile, shutil
from PIL import Image

modDirs = ['..', os.path.expanduser('~/.steam/steam/steamapps/common/Factorio/data')]

configFile = open('../../script-output/boxing-icons', 'r')
config = configFile.read().split("\n")[:-1]

for i in range(len(config)):
	config[i] = config[i].split('=')


arrowUpIcon = Image.open('graphics/icons/arrow-16.png')
arrowDownIcon = arrowUpIcon.transpose(Image.FLIP_TOP_BOTTOM)
boxIcons = {}
for boxType in ['wooden', 'steel', 'tungsten']:
	boxIcons[boxType] = {
		24 : Image.open('graphics/icons/' + boxType + '-24.png'),
		32 : Image.open('graphics/icons/' + boxType + '-32.png')
	}


mods = {}

iconLists = {}

tmp = tempfile.mkdtemp('factorio-boxing-icons')
try:
	for item, iconPath in config:
		mod = iconPath[:iconPath.find('/')].strip('_')
		if not mod in mods:
			path = ''
			for modDir in modDirs:
				paths = glob.glob(os.path.join(modDir, mod) + '*')
				if len(paths) > 0:
					path = paths[0]
					break
			if path == '':
				print "Couldn't find mod " + mod
				exit(1)
			elif not os.path.isdir(path):
				os.mkdir(os.path.join(tmp, mod))
			mods[mod] = path
			iconLists[mod] = set();
			print "Found mod " + mod + ": " + path
		path = iconPath[iconPath.find('/')+1:]
		if os.path.isdir(mods[mod]):
			path = os.path.join(mods[mod], path)
		else:
		 	zf = zipfile.ZipFile(mods[mod])
			for zff in zf.namelist():
				if zff.endswith(path):
					path = zff
					break
		 	path = zf.extract(path, os.path.join(tmp, mod))
		if not os.path.isfile(path):
			print path + " is not a file"
			exit(1)
		print path

		iconDir = iconPath[iconPath.find('/')+1:iconPath.rfind('/')]
		iconName = iconPath[iconPath.rfind('/')+1:]
		iconLists[mod].add(iconDir + '/' + iconName)
		itemIcon = Image.open(path)
		itemIcon = itemIcon.resize((16,16), Image.BICUBIC)
		itemIcon = itemIcon.convert('RGBA')
		for boxType, boxIcon in boxIcons.items():
			if not os.path.isdir(os.path.join('graphics/icons/unbox/', boxType, mod, iconDir)):
				os.makedirs(os.path.join('graphics/icons/unbox/', boxType, mod, iconDir), 0o755)
			if not os.path.isdir(os.path.join('graphics/icons/box/', boxType, mod, iconDir)):
				os.makedirs(os.path.join('graphics/icons/box/', boxType, mod, iconDir), 0o755)
			if not os.path.isdir(os.path.join('graphics/icons/box-of/', boxType, mod, iconDir)):
				os.makedirs(os.path.join('graphics/icons/box-of/', boxType, mod, iconDir), 0o755)

			unbox = Image.new('RGBA', (32, 32))
			unbox.paste(boxIcon[24], (4, 8))
			unbox.paste(itemIcon, (8, 0), itemIcon)
			unbox.paste(arrowUpIcon, (12, 8), arrowUpIcon)
			unbox.save(os.path.join('graphics/icons/unbox/', boxType, mod, iconDir, iconName))

			box = Image.new('RGBA', (32, 32))
			box.paste(boxIcon[24], (4, 8))
			box.paste(itemIcon, (8, 0), itemIcon)
			box.paste(arrowDownIcon, (12, 8), arrowDownIcon)
			box.save(os.path.join('graphics/icons/box/', boxType, mod, iconDir, iconName))

			boxOf = Image.new('RGBA', (32, 32))
			itemCollectionIcon = Image.new('RGBA', (22, 13))
			itemCollectionIcon.paste(itemIcon, (11, 5), itemIcon)
			itemCollectionIcon.paste(itemIcon, (0, 3), itemIcon)
			itemCollectionIcon.paste(itemIcon, (3, 0), itemIcon)
			boxOf.paste(boxIcon[32], (0, 0))
			boxOf.paste(itemCollectionIcon, (5, 0), itemCollectionIcon)
			boxOf.save(os.path.join('graphics/icons/box-of/', boxType, mod, iconDir, iconName))
finally:
	shutil.rmtree(tmp)

for mod, icons in iconLists.items():
	if os.path.exists(os.path.join('icon-lists', mod)):
		iconFile = open(os.path.join('icon-lists', mod), 'r')
		oldIcons = set(eval(iconFile.read()))
		iconFile.close()
		icons |= oldIcons
	icons = sorted(icons)
	iconFile = open(os.path.join('icon-lists', mod), 'w')
	iconFile.write(repr(icons))

	luaFile = open(os.path.join('icon-lists', mod + '.lua'), 'w')
	luaFile.write('boxing.icons["' + mod + '"] = {\n')
	for icon in icons:
		luaFile.write('\t["' + icon + '"] = true,\n')
	luaFile.write('};\n')
	luaFile.close()

iconListFiles = glob.glob('icon-lists/*.lua')
iconListFiles.sort()
iconListList = open('icon-lists.lua', 'w')
iconListList.write('boxing["icon-lists"] = {\n')
for listFile in iconListFiles:
	iconListList.write('\t"' + listFile + '",\n')
iconListList.write('};\n')
iconListList.close()
